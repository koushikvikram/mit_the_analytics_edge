sqrt2 = sqrt(2) # assign the value of sqrt(2) to the variable sqrt2 
hoursYear <- 365*24 # calculate the number of hours in a year and assign it to the variable hoursYear

######### vectors and data frames

# vectors
# you can create vectors in R using the combine function
# a vector is a series of numbers or characters stored as the same object
# you shouldn't combine characters and numbers in a vector - R will convert the numbers to characters
# R only allows one data type in each vector

c(2,3,5,8,13) # combine function
Country = c("Brazil", "China", "India", "Switzerland", "USA") # a vector of characters
LifeExpectancy = c(74, 76, 65, 83, 79) # a vector of numbers
Country[1] # returns the 1st element of Country vector
LifeExpectancy[3] # returns the 3rd element of LifeExpectancy vector

seq(0, 100, 2) # creates a sequence of numbers from 0 to 100 in increments of two
# seq can be useful if you want to create a unique identifier for observations

# dataframes - important data structure
# many algorithms in R require all of the data to be in a single object like a data frame
CountryData = data.frame(Country, LifeExpectancy) # we can combine the Country and LifeExpectancy vectors to create the CountryData dataframe

# adding another variable to our data frame
CountryData$Population = c(199000, 1390000, 1240000, 7997, 318000)

# adding new observations for Australia and Greece
Country = c("Australia", "Greece")
LifeExpectancy = c(82, 81)
Population = c(23050, 11125)
NewCountryData = data.frame(Country, LifeExpectancy, Population)
AllCountryData = rbind(CountryData, NewCountryData) # combines data frames by stacking the rows


