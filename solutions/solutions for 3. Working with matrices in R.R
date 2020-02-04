# solutions for "Introduction to R" part "3. Working with matrices in R".
# by Hans Henrik Sievertsen (h.h.sievertsen@bristol.ac.uk), Jan 28, 2020.
# Objective: getting used to working with matrices in R.



# Exercise 1: Create a matrix with 3 rows and 3 columns, where each cell value is a draw from
#             a random normal distribution. Save as object A and print A in the console. 
A<-matrix(rnorm(n=9),nrow=3)
print(A)

# Exercise 2: Create a matrix with 3 rows and 3 columns, where each cell value is a draw from
#             a random normal distribution. Save the matrix as object B and multiply A with B 
#             (using matrix multiplication, not element wise multiplication). 
#             Save the resulting matrix as C and print C in the console.
B<-matrix(rnorm(n=9),nrow=3)
C<-A%*%B

# Exercise 3: Compute the determinant of C.
#             Is C  singular?
det(C)

# Exercise 4: Compute the inverse of C and verify that the inverse of C times C
#             gives the identity matrix.
Cinverse<-solve(C)
C%*%Cinverse

# Exercise 5: load the dataset "example_data1.csv" and estimate the following model:
#             test_year_2=alpha0+alpha1*parental_schooling+alpha2*parental_lincome+e
#             using OLS with the lm() function. Print the results in the console.
mydata<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")
lmfit<-lm(test_year_2~parental_schooling+parental_lincome,data=mydata)
summary(lmfit)

# Exercise 6: Estimate the same model as in Exercise 5, but this time you do it manually using 
#             matrix algebra. Compare the results to the results from exercise 5.
y<-mydata%>%select(test_year_2)%>%as.matrix()
X<-mydata%>%select(parental_schooling,parental_lincome)%>%mutate(constant=1)%>%as.matrix()
betahat<-solve(t(X)%*%X)%*%t(X)%*%y
betahat
# Exercise 7: Compute the residuals from the regression and create a q-q plot. 
residuals<-y-X%*%betahat
qqnorm(residuals)
