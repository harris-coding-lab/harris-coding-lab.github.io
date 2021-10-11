# The purpose of this file is to report on student completion
# and performance for lab session exit tickets.

library(tidyverse)

# Set working directory to current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load official roster from Canvas
# "canvas_gradebook.csv" is an export from the "Grades" section of Canvas.
canvas_roster <- read.csv("canvas_gradebook.csv") %>%
  drop_na("ID") %>%
  filter(Student != "Student, Test") %>%
  select(cnet="SIS.Login.ID")

# Load Google skill poll results
# "student_skill_poll.csv" is an export from this Google Sheet:
# https://docs.google.com/spreadsheets/d/1QaCb7fBVe23j-JLzicIkpl9KZM7vfRYfSpu4TnUm4qo/edit?resourcekey#gid=1985736910
student_skill_poll <- read.csv("student_skill_poll.csv") %>%
  select(!c(Timestamp, Name)) %>%
  mutate(Uchicago.email=gsub("@.*", "", Uchicago.email)) %>%
  `colnames<-`(c("cnet", "coding_experience", "r_installed", "coding_experience_fall_only")) %>%
  filter(!(cnet=="olivia9olvera" & coding_level==""))

# Load Gradescope results
# I used "Export Evaluations" on Gradescope, which creates a 
# csv for each question from the Gradescope exit ticket.
# Replace the path with the path of your Gradescope ticket.
files <- list.files(path = "./PPHA_30111_3_2_1_Coding_Lab_for_Public_Policy_Level_I_comprehension_check_2",
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
  merge(gradescope_results, by="cnet", all.x=TRUE)

# Report proportion of students completing test
df %>%
  ggplot(aes(completed_gradescope_exercise, fill=completed_gradescope_exercise)) +
  geom_bar() +
  theme(legend.position = "none") +
  geom_text(stat='count', aes(label=..count..), vjust=2) +
  geom_text(stat='count', aes(label = scales::percent((..count..)/sum(..count..))), vjust=4) +
  labs(title = str_wrap("Count of students on Canvas who completed the exercise", 30))

# - subgroup analysis on people who are beginners / never pollers	
# TODO: performance by group

# - show common errors.		
# TODO: print all comments/frequency of comments