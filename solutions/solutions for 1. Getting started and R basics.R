# solutions for "Introduction to R" part "1. Getting started & R basics".
# by Hans Henrik Sievertsen (h.h.sievertsen@bristol.ac.uk), Jan 28, 2020.
# Objective: getting used to the R environment.



# Exercise 1: The object value3 should contain the product of value1 and value2. 
#             Replace XYZ with the correct code. Run the code after you replaced XYZ.

value1<-24
value2<-314
value3<-value1*value2


# Exercise 2: Print the object called value3. Replace XYZ with the correct code.
#             Run the code to verify that it works.
print(value3)

# Exercise 3: The object named vector1 should contain the range of numbers from
#             54 to 1414 in steps of 0.25. Replace XYZ with the correct code. 
#             Run the code to verify that it works.
vector1<-seq(5,1414,by=0.25)
print(vector1)


# Exercise 4: The following lines of code should print "Hello" followed by your name.
#             Replace XYZ with the correct code. 
#             Run the code to verify that it works.
obj1<-"Hello"
obj2<-"Hans"
obj3<-paste(obj1,obj2,sep=" ")
print(obj3)

# Exercise 5: Specify the working directory to directory where this file is saved.
#             Replace XYZ with the correct code. 
#             Run the code to verify that it works. How can you verify it?
setwd("~/")

# Exercise 6: Create a vector of length 25, where all elements are 1s.
#             Replace XYZ with the correct code. 
#             Run the code to verify that it works. 
vector1<-rep(1,25)
print(vector1)

# Exercise 7: Create a vector of length 25 with draws from a normal distribution
#             and call the vector vector2. Add vector2 to vector1 created 
#             and store the resulting vector in an object named vector3.
#             Print the content of vector3 in the console. 
#             Run the code to verify that it works. 
vector2<-rnorm(n=25)
vector3<-vector1+vector2
print(vector3)

# Exercise 8: Create a list containing vector3 from exercise 7 above and obj3 from 
#             exercise 4. Give the list a name of your choice and  print the content 
#             of the list in the console. 
#             Run the code to verify that it works. 
mylist<-list(vector3,obj3)
print(mylist)

# Exercise 9: We can use rm() to remove elements from the workspace. For example rm(obj2) 
#             will remove the element obj2. Remove all elements from the workspace.
#             Run the code to verify that it works. How can you verify it?
rm(obj1,obj2,obj3,vector1,vector2,vector3, mylist, value1,value2,value3)

# Exercise 10: The function ls() creates a list of all objects in the workspace. We can 
#              therefore use rm(list=ls()) to remove all elements in the workspace. 
#              Run the codes for exercise 1 to 8 again and remove all elements with rm(list=ls()).
rm(list=ls())

