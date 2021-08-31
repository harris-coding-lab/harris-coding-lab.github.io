## Accelerated Coding Lab

This website (harris-coding-lab.github.io) contains the content for the Harris School's Accelerated Coding Lab. The workshops aim to introduce R programming concepts with a focus on preparing and analyzing data, and conducting statistical simulations. We will cover how to read data into R,  manipulate data with a suite of tools from the `tidyverse` package `dplyr`. We will also discuss some basic programming concepts including data types, operators, control flow with if statements and for loops, as well as how to write your own functions.

### Before Day 1:

- We ask that Coding Lab attendees have the latest stable versions of [R](https://cloud.r-project.org/) and [RStudio](https://rstudio.com/products/rstudio/download/#download) pre-installed on their local machine. We have instructions for Mac and Windows users in this [google doc](https://docs.google.com/document/d/1605JCpH3sV8lBG2x-PsxIQcB9rh3qY5zglfRnUbf43A/). We can help you if your stuck, and you can email the amazing staff of Harris IT at hsit-servicedesk@uchicago.edu as well.

- Complete the "Pre-work". Watch the intro videos and complete the lab. (see below for links.)

- Watch videos for Class 1.

Note: the lab material for future classes is "under review" and will be updated prior to camp.


### Materials
Links to materials for each week's workshop will be posted here as provided. For each class, watch the video. Then, go to lab and attempt the lab

| Class  | Videos | Slides & Code |  Problem sets | Additional Resources |
| ---- | ----- | ----- | ----- | --- |
|**Pre-work: Why R?**| [video part 1: why R?](https://youtu.be/2_6LRKBe28A) (~ 10 min) <br> [video part 2: a quick introduction to R, Rstudio and `tidyverse`](https://youtu.be/PvrUfHWzyII) (~ 14 min) | [slides](slides/00_introduction.pdf) <br> [slide code](code/00_introduction.R) | - [lab 0](lab/00_lab_intro_to_R_and_tidyverse.pdf) <br> - [lab code!](code/00_lab_intro_to_R_and_tidyverse.R) <br> - [solutions](lab/00_lab_intro_to_R_and_tidyverse_solutions.pdf)| Note: Make sure to download the lab code! |
|**Class 1: Reading data files and manipulating data with `dplyr`** | [video 1: reading data](https://youtu.be/WwoMJODwFOQ) (~ 10 min) <br> [video 2: manipulating data with `dplyr`](https://youtu.be/o1a-9-RvNc4) (~ 18 min) |- [slides: reading data](slides/01a_reading-data.pdf) <br> - [slides: manipulating data with `dplyr`](slides/01b_dplyr-manipulating-data.pdf) <br> - [slide code: reading data](code/01a_reading-data.R)  <br>  - [slide code: manipulating data with `dplyr`](code/01b_manipulating-data-dplyr.R) | - [lab 1](lab/01_read_and_manipulate_data.pdf) <br>- [basics review](lab/01_read_and_manipulate_data_basics.pdf) <br> <!-- -[solutions](lab/01_read_and_manipulate_data_solutions.pdf)-->| [FED data from slides](data/SCE-Public-LM-Quarterly-Microdata.xlsx) (you can download to follow along) <br>[texas data from slides](data/texas_housing_data.csv) <br> [drug cartel data from slide](https://dataverse.harvard.edu/file.xhtml?persistentId=doi:10.7910/DVN/VIXNNE/XH5ZQU&version=1.0) (you'll need to download the `dta` from Dataverse)|
|**Class 2: Vectors and Data Types**|[video](https://youtu.be/0MIeGk_xwiQ) (~ 22 min)| [slides](slides/02_vectors-and-data-types.pdf) <br> [slide code](code/02_vectors-and-data-types.R) | - [lab 2](lab/02_vectors_and_dtypes.pdf) <br> - [basics review](lab/02_basics_vectors_and_datatypes.pdf) <br> <!-- - [solutions](lab/02_vectors_and_dtypes_solutions.pdf)--> | [lab code](lab/02_vectors_and_dtypes.R) |
|**Class 3: If Statements** | [video](https://www.youtube.com/watch?v=HKC7RTpNt60) (~ 20 min) | [slides](slides/03_if-statements.pdf) <br> [slide code](code/03_if-statements.R) | - [lab 3](lab/03_if_statements.pdf) <br> - [basic review](lab/03_basics_if_else.pdf) <br> <!-- - [solutions](lab/03_if_statements_solution.pdf)-->| - [lab code](lab/03_if_statements.R) |
|**Class 4: Grouped analysis with `dplyr`**| [video](https://youtu.be/9EQ9WB90VPw) (~13 min) |  [slides](slides/04_grouped-data.pdf) <br> [slide code](code/04_grouped-data.R) | - [lab 4](lab/04_grouped_analysis.pdf) <br> - [basic review](lab/04_basics_grouped_analysis.pdf) <br> <!-- -[solutions](lab/04_grouped_analysis_solutions.pdf)-->| - [lab code](lab/04_grouped_analysis.R)  |
|**Class 5: Iteration** | [video]( https://youtu.be/0z8N8S-vz4U ) (~22 min)| - [slides](slides/07_for_loops.pdf) <br> - [slide code](code/07_for_loops.R)|- [basics review](lab/07_basics_loops.pdf) <br> - [lab 5](fall_labs/loops/for-loops-ggplot.zip)  | |
|**Class 6: Functions** | [video]( https://youtu.be/Y2SbF9JHI7Q  )(~16 min) | - [slides](slides/06_functions.pdf) <br>  - [slide code](code/06_functions.R)| - [basics review](lab/06_basics_functions.pdf) <br> - [lab 6](fall_labs/functions/functions.zip) <br> - <!--[lab 6 solved](fall_labs/functions/functions_solved.zip)-->| |
|**Bonus Class: Visualizing data with `ggplot`**| [video](https://youtu.be/rnaWwRfrWk4 ) (~ 18 min) | - [slides](slides/05_ggplot.pdf) <br> - [slide code](code/05_ggplot.R)|  - [basic review](lab/05_basics_ggplot.pdf) | |

### [Final Project](lab/project_description.pdf)

Your [final project](lab/project_description.pdf) is quite simple. You will pick a data set that speaks to you and try to uncover something interesting which you will visualize in a plot. You will also compute some summary statistics that you will show in a summary table. We'll provide feedback on your submission. Click on the link for details.


### Questions




### Additional Resources
- [tidyverse cheetsheets](https://rstudio.com/resources/cheatsheets/) start with `dplyr` and `ggplot`
- [R for Data Science](https://r4ds.had.co.nz/): free online book with clear explanations of many `tidyverse` functions, the book to read on data analysis with R
- [DataQuest.io](https://www.dataquest.io): online modules about specific programming concepts, access provided by Harris. For students who would like additional guided practice we recommend:
  - **Vectors**
    - [introduction to programming in r](https://app.dataquest.io/m/332/introduction-to-programming-in-r)
    - [working with vectors](https://app.dataquest.io/m/333/working-with-vectors)
    - [vectorized functions](https://app.dataquest.io/m/339/working-with-vectorized-functions)
  - **Data frames**
    - [working with data frames](https://app.dataquest.io/m/336/working-with-data-frames/)
    - [dplyr to investigate frequency distributions of data](https://app.dataquest.io/m/396/frequency-distributions)
  - **Control flow and if statements**
    - [control flow](https://app.dataquest.io/m/338/working-with-control-structures)
  - **Functions**
    - [writing custom functions](https://app.dataquest.io/m/340/writing-custom-functions)
    - [working with functionals](https://app.dataquest.io/m/341/working-with-functionals) (includes discussion of map)
  - **Extensions**
     - [random sampling with `sample()`](https://app.dataquest.io/m/393/simple-random-sampling)
     - [basic string manipulation](https://app.dataquest.io/m/342/fundamentals-of-string-manipulation)
     - [`gather()` and correlations](https://app.dataquest.io/m/325/correlations-and-reshaping-data/4/gathering-data-into-columns)
       - "step 2" is all about `ggplot` and potentially useful.
  - They're always adding content, so we probably missed some good ones.

### Instructors

The instructors for the Accelerated course is (see Canvas for emails):

- Ari Anisfeld

### Teaching Assistants

The teaching assistants for this course are:

- Qiwei Lin
- Thomas Whamond
- Jay Zaleski

and

- Rubina Hundal
