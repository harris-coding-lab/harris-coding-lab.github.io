# The purpose of this file is to report on student completion
# and performance for lab session exit tickets.

library(tidyverse)
library(reshape2)
library(stargazer)

# Set working directory to current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load official roster from Canvas
# "canvas_gradebook.csv" is an export from the "Grades" section of Canvas.
canvas_roster <- read.csv("canvas_gradebook.csv") %>%
# canvas_roster <- read.csv("PATH_TO_YOUR_DOWNLOAD_OF_THE_CANVAS_GRADEBOOK.csv") %>%
  drop_na("ID") %>%
  filter(Student != "Student, Test") %>%
  select(cnet="SIS.Login.ID")

# Load Google skill poll results
# "student_skill_poll.csv" is an export from this Google Sheet:
# https://docs.google.com/spreadsheets/d/1QaCb7fBVe23j-JLzicIkpl9KZM7vfRYfSpu4TnUm4qo/edit?resourcekey#gid=1985736910
student_skill_poll <- read.csv("student_skill_poll.csv") %>%
# student_skill_poll <- read.csv("PATH_TO_YOUR_DOWNLOAD_OF_THE_SKILL_POLL.csv") %>%  
  select(!c(Timestamp, Name)) %>%
  mutate(Uchicago.email=gsub("@.*", "", Uchicago.email)) %>%
  `colnames<-`(c("cnet", "coding_experience", "r_installed", "coding_experience_fall_only")) %>%
  filter(!(cnet=="olivia9olvera" & coding_experience_fall_only==""))

# Load Gradescope results
# I used "Export Evaluations" on Gradescope, which creates a 
# zipped folder containing a csv for each question on the
# Gradescope exit ticket. 
files <- list.files(path = "./PPHA_30111_3_2_1_Coding_Lab_for_Public_Policy_Level_I_comprehension_check_2",
# files <- list.files(path = "PATH_TO_GRADESCOPE_EVALUATIONS_FOLDER",
           pattern = "*.csv", 
           full.names = T)

gradescope_results <- list()
for(i in 1:length(files)){
  gradescope_results[[i]] <- read.csv(files[i]) %>%
    head(-3) %>%
    mutate(Email=gsub("@.*", "", Email)) %>%
    rename(cnet = Email) %>%
    select(c(cnet, Score, Comments)) %>%
    `colnames<-`(c("cnet", paste0("problem_", i, "_score"), paste0("problem_", i, "_comment")))
}
gradescope_results <- data.frame(gradescope_results) %>%
  select(-contains("cnet.")) %>%
  mutate(completed_gradescope_exercise = TRUE)

# Merge Canvas roster, skill poll results, and Gradescope results
df <- canvas_roster %>%
  merge(student_skill_poll, by="cnet", all.x=TRUE) %>%
  filter(cnet != "") %>%
  merge(gradescope_results, by="cnet", all.x=TRUE) %>%
  mutate(
    coding_experience_fall_only = 
      ifelse(coding_experience_fall_only == "" | is.na(coding_experience_fall_only), 
             "Unknown Experience (NA)", 
             coding_experience_fall_only)) %>%
  mutate(completed_gradescope_exercise = ifelse(
    is.na(completed_gradescope_exercise), FALSE, TRUE
  ))
  # df should have 143 students (unless someone was added late)

# Report proportion of students completing exercise
df %>%
  ggplot(aes(completed_gradescope_exercise, fill=completed_gradescope_exercise)) +
  geom_bar() +
  theme(legend.position = "none") +
  geom_text(stat='count', aes(label=..count..), vjust=2) +
  geom_text(stat='count', aes(label = scales::percent((..count..)/sum(..count..))), vjust=4) +
  labs(title = str_wrap("Proportion and count of students on Canvas who completed the exercise", 50),
       x = "Completed Gradescope Exercise")
ggsave("prop_complete.png", width = 6, height = 4)

# Subgroup analysis on people who are beginners / complete newbies
df %>%
  ggplot(aes(
    x = coding_experience_fall_only, 
    fill = completed_gradescope_exercise)) +
  geom_bar(position="fill") +
  labs(title = str_wrap("Proportion of students who completed the exercise by experience", 30),
       x = "Coding Experience", y = "")
ggsave("prop_complete_by_exp.png", width = 6, height = 4)

problem_list <- c()
for(i in 1:length(files)){
  problem_list <- c(problem_list, paste0("problem_", i, "_score"))
}
df %>% 
  group_by(coding_experience_fall_only) %>%
  summarise_at(problem_list, mean, na.rm = TRUE) %>%
  pivot_longer(problem_list, names_to="problem", values_to="avg") %>%
  ggplot(aes(x=coding_experience_fall_only, y=avg,
             fill=coding_experience_fall_only)) +
  geom_bar(stat="identity") +
  geom_text(aes(label = round(avg, digits = 3)), vjust=1.5) +
  facet_wrap(vars(problem)) +
  labs(title = "Average scores by student group for each problem",
       x = "Coding Experience Level",
       y = "Average Problem Score") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggsave("scores_by_exp.png", width = 9, height = 6)

# - Show common errors.		
comments <- df %>% 
  select(ends_with("_comment")) %>%
  pivot_longer(everything())

comments %>%
  group_by(value) %>%
  count() %>%
  stargazer(summary = FALSE,
            out = "comments_and_frequencies.html")

# IMPORTANT: After producing these plots, please move them to a
# sub-directory within the repository.

