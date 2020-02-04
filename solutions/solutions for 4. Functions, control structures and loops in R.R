# exercises for "Introduction to R" part "4. Functions, control structures and loops in R".
# by Hans Henrik Sievertsen (h.h.sievertsen@bristol.ac.uk), Jan 28, 2020.
# Objective: getting used to working with matrices in R.



# Exercise 1: Create a function that takes one argument called name. The function should 
#             print "Hello X" where X is the name provided by the user. In other words, it 
#             should work as follows: 
#             
#             myfunction("Hans")
#              [1] "Hello Hans"
myfunction<-function(name){
  output<-paste("Hello",name)
  print(output)
}
myfunction("Hans")

# Exercise 2: Add control structure in your function and default argument values, such that
#             if the user did not provide a name, the function prints "Hello World" and a
#             warning that default values are used. 
myfunction<-function(name="World"){
  if (missing(name)){
    print("Warning: Argument not provided. Default used.")
  }
  output<-paste("Hello",name)
  print(output)
}
myfunction()
myfunction("Hans")

# Exercise 4: Estimate a probit model of summer camp participation,
#             as  function of parental income, parental schooling and child gender. using
#             glm() function in R. 

# Load data
mydata<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")
# Estimate the probit model
probitfit<-glm(summercamp~parental_lincome+female+parental_schooling,
            family = binomial(link = "probit"), data = mydata)
# Show parameter estimates
summary(probitfit)

# Exercise 5: Write the log likelihood for a probit model of summer camp participation,
#             as  function of parental income, parental schooling and child gender. Insert
#             the parameters obtained in exercise 4 and calculate the log likelihood.
# load data
df<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")
# y variable
y<-df%>%select(summercamp)%>%as.matrix()
# x variable 
X<-df%>%select(parental_lincome,female,parental_schooling)%>%mutate(constant=1)%>%as.matrix()
# xb (note constant is given last)
xb<-X%*%c(0.35410,0.04908,0.40710 ,-10.57368)
# log likelihood
l<-sum(y*log(pnorm(xb))+(1-y)*log(1-pnorm(xb)))
# return value
l

# Exercise 6: Find the maximum likelihood estimate using the optim() function and compare
#             the estimates to the results from exercise 4.
my_loglikelihood <- function(y,x,beta,data) {
  # specify dataset
  df<-data
  # extract the dependent variable and the covariates
  yvar<-df%>%select(y)%>%as.matrix()
  Xvar<-df%>%select(x)%>%mutate(constant=1)%>%as.matrix()
  # beta
  betavec=beta
  # xb (note constant is given last)
  xb<-Xvar%*%betavec
  # log likelihood
  l<-sum(yvar*log(pnorm(xb))+(1-yvar)*log(1-pnorm(xb)))
  # return (explicitly tell R to return this object)!
  return(l) 
}
df<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")
# use the R function optim to optimize ll
optim(par=c(0,0,0,0), fn=my_loglikelihood, control=list(fnscale = -1),
      x=c("parental_lincome","female","parental_schooling"),y="summercamp",data=df)

# Exercise 7: Manually find the optimum using a while loop, but keeping all but one parameter
#             fixed at the parameter values obtained in exercise 6. 
# clear workspace
rm(list=ls())
# define function
my_loglikelihood <- function(y,x,beta,data) {
  # specify dataset
  df<-data
  # extract the dependent variable and the covariates
  yvar<-df%>%select(y)%>%as.matrix()
  Xvar<-df%>%select(x)%>%mutate(constant=1)%>%as.matrix()
  # beta
  betavec=beta
  # xb (note constant is given last)
  xb<-Xvar%*%betavec
  # log likelihood
  l<-sum(yvar*log(pnorm(xb))+(1-yvar)*log(1-pnorm(xb)))
  # return (explicitly tell R to return this object)!
  return(l) 
}
# load data 
df<-read_csv("https://github.com/hhsievertsen/R_introduction/raw/master/datasets/example_data1.csv")
# starting values
beta1<-0
llvaluelag<--Inf
# start loop 
max_Iter<-10000
steps<-0.001
for (x in 1:max_Iter) {
  llvalue<-my_loglikelihood(beta=c(beta1,0.04899958,0.40704329,-10.57364160),x=c("parental_lincome","female","parental_schooling"),y="summercamp",data=df)
  beta1<<-beta1+steps # update value
  # update ll
  change<-(llvalue-llvaluelag)
  llvaluelag<-llvalue
  # print
  print (llvalue)
  # stop if change is negative
  if (change<0) {
    print(paste("The estimate for beta 1 is:",beta1))
    break
  }
}