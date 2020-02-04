# solutions for "Introduction to R" part "2. Tidyverse".
# by Hans Henrik Sievertsen (h.h.sievertsen@bristol.ac.uk), Jan 28, 2020.
# Objective: getting used to the tidyverse package functionality



# Exercise 1: Install tidyverse 
install.packages("tidyverse")

# Exercise 2: Load tidyverse
library("tidyverse")

# Exercise 3: Load the dataset "example_data1.csv" and save it under a name
#             of your choice.
mydata<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")

# Exercise 4: Create a new variable in the new dataset that is defined as the
#             average of the variables test_year_1, test_year_3 and test_year_5.
#             Save the modified dataset.             
mydata<-mutate(mydata,testscoreaverage=(test_year_1+test_year_3+test_year_5)/3)

# Exercise 5: Use the dataset created in exercise 4 and keep only the observations
#             from school 4 and 15 (based on the school_id variable).
#             Save the modified dataset.
mydata<-filter(mydata,school_id==4|school_id==15)
# Exercise 6: Use the dataset created in exercise 5 and group the dataset on the variables
#             summercamp and female. Calculate the average of the test score variable created 
#             in exercise 4 by summercamp participation and gender using the summarise() function.
#             Save the results in a new object and print them in the console.
#             The printed result should be as follows:
mydata<-group_by(mydata,summercamp,female)
mydata<-summarise(mydata,mean=mean(testscoreaverage))
print(mydata)

# Exercise 7: Repeat exercise 1-5 again, but use the %>% operator to do all this in one step.
mydata<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")%>%
        mutate(testscoreaverage=(test_year_1+test_year_3+test_year_5)/3)%>%
        filter(school_id==4|school_id==15)%>%
        group_by(summercamp,female)%>%
        summarise(mean=mean(testscoreaverage))
print(mydata)

# Exercise 8: Load the dataset again and make it tidy. Save the tidy data set under a new object name.
tidydata<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")%>%
          pivot_longer(names_to="test_year",values_to = "score",cols =7:15 )%>%
          mutate(test_year=as.numeric(substr(test_year,11,11))) 

# Exercise 9: Use ggplot() to create a line chart of average test scores over years by summercamp
#             participation status. In other words: the y axis shows the average test score, the x-axis the
#             year of the test score, and the chart contains two lines. One line for those who participated 
#             in the summer school and one line who did not.
#             This task is challenging and requires you to study some of the referenced material in the slides.

# prepare data
collapsed_data<-tidydata%>%
                group_by(summercamp,test_year)%>%
                summarise(score=mean(score))%>%
                mutate(camp=ifelse(summercamp==0,"Attended summer camp", "Did not attend"))
# create basic chart
ggplot(collapsed_data,aes(x=test_year,y=score,colour=camp))+
       geom_line()+
       labs(x="Test Year", y="Test score", colour=" ")+
       theme_classic()+
       theme(legend.position = "top")