# exercises for "Introduction to R" part "2. Tidyverse".
# by Hans Henrik Sievertsen (h.h.sievertsen@bristol.ac.uk), Jan 28, 2020.
# Objective: getting used to the tidyverse package functionality



# Exercise 1: Install tidyverse 

# Exercise 2: Load tidyverse

# Exercise 3: Load the dataset "example_data1.csv" and save it under a name
#             of your choice.

# Exercise 4: Create a new variable in the new dataset that is defined as the
#             average of the variables test_year_1, test_year_3 and test_year_5.
#             Save the modified dataset.             

# Exercise 5: Use the dataset created in exercise 4 and keep only the observations
#             from school 4 and 15 (based on the school_id variable).
#             Save the modified dataset.

# Exercise 6: Use the dataset created in exercise 5 and group the dataset on the variables
#             summercamp and female. Calculate the average of the test score variable created 
#             in exercise 4 by summercamp participation and gender using the summarise() function.
#             Save the results in a new object and print them in the console.
#             The printed result should be as follows:

                # A tibble: 4 x 3
                  # Groups:   female [2]
                  #female summercamp  mean
                  #<dbl>      <dbl> <dbl>
                  #  1      0          0  1.53
                  #  2      0          1  2.54
                  #  3      1          0  1.90
                  #  4      1          1  2.34

# Exercise 7: Repeat exercise 1-5 again, but use the %>% operator to do all this in one step.


# Exercise 8: Load the dataset again and make it tidy. Save the tidy data set under a new object name.


# Exercise 9: Use ggplot() to create a line chart of average test scores over years by summercamp
#             participation status. In other words: the y axis shows the average test score, the x-axis the
#             year of the test score, and the chart contains two lines. One line for those who participated 
#             in the summer school and one line who did not.
#             This task is challenging and requires you to study some of the referenced material in the slides.





