# exercises for "Introduction to R" part "4. Functions, control structures and loops in R".
# by Hans Henrik Sievertsen (h.h.sievertsen@bristol.ac.uk), Jan 28, 2020.
# Objective: getting used to working with matrices in R.



# Exercise 1: Create a function that takes one argument called name. The function should 
#             print "Hello X" where X is the name provided by the user. In other words, it 
#             should work as follows: 
#             
#             myfunction("Hans")
#              [1] "Hello Hans"


# Exercise 2: Add control structure in your function and default argument values, such that
#             if the user did not provide a name, the function prints "Hello World" and a
#             warning that default values are used. 

# Exercise 3: Create a function that estimates a model with ordinary least squares. You
#             should use the matrix tools from part 3 for that. The function should return 
#             the beta coefficients. 

# Exercise 4: Estimate a probit model of summer camp participation,
#             as  function of parental income, parental schooling and child gender. using
#             glm() function in R. 


# Exercise 5: Write the log likelihood for a probit model of summer camp participation,
#             as  function of parental income, parental schooling and child gender. Insert
#             the parameters obtained in exercise 4 and calculate the log likelihood.


# Exercise 6: Find the maximum likelihood estimate using the optim() function and compare
#             the estimates to the results from exercise 4.

# Exercise 7: Manually find the optimum using a while loop, but keeping all but one parameter
#             fixed at the parameter values obtained in exercise 6. 

