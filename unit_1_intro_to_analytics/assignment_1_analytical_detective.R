# Assignment 1
 
# An Analytical Detective
# Please download the file mvtWeek1.csv for this problem 
# (do not open this file in any spreadsheet software before completing this problem because it might change the format of the Date field). 

# Here is a list of descriptions of the variables:
#   
# ID: a unique identifier for each observation
# Date: the date the crime occurred
# LocationDescription: the location where the crime occurred
# Arrest: whether or not an arrest was made for the crime (TRUE if an arrest was made, and FALSE if an arrest was not made)
# Domestic: whether or not the crime was a domestic crime, meaning that it was committed against a family member (TRUE if it was domestic, and FALSE if it was not domestic)
# Beat: the area, or "beat" in which the crime occurred. This is the smallest regional division defined by the Chicago police department.
# District: the police district in which the crime occured. Each district is composed of many beats, and are defined by the Chicago Police Department.
# CommunityArea: the community area in which the crime occurred. Since the 1920s, Chicago has been divided into what are called "community areas", of which there are now 77. The community areas were devised in an attempt to create socially homogeneous regions.
# Year: the year in which the crime occurred.
# Latitude: the latitude of the location at which the crime occurred.
# Longitude: the longitude of the location at which the crime occurred.



# Problem 1 - Loading the Data
# Read the dataset mvtWeek1.csv into R, using the read.csv function, and call the data frame "mvt". Remember to navigate to the directory on your computer containing the file mvtWeek1.csv first. It may take a few minutes to read in the data, since it is pretty large. 
# Then, use the str and summary functions to answer the following questions.

# How many rows of data (observations) are in this dataset?
mvt = read.csv("mvtWeek1.csv")
str(mvt) 
# rows of data = 191641

# How many variables are in this dataset?
# variables = 11

# Using the "max" function, what is the maximum value of the variable "ID"?
max(mvt$ID) # 9181151

# What is the minimum value of the variable "Beat"?
min(mvt$Beat) # 111

# How many observations have value TRUE in the Arrest variable (this is the number of crimes for which an arrest was made)?
summary(mvt) # 15536

# How many observations have a LocationDescription value of ALLEY?
# 2308


# Problem 2 - Understanding Dates in R
# In many datasets, like this one, you have a date field. Unfortunately, R does not automatically recognize entries that look like dates. 
# We need to use a function in R to extract the date and time. 
# Take a look at the first entry of Date (remember to use square brackets when looking at a certain entry of a variable).
head(mvt$Date, 1) # Month/Day/Year Hour:Minute
# In what format are the entries in the variable Date?
# Month/Day/Year Hour:Minute

# Now, let's convert these characters into a Date object in R. In your R console, type
# DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
# This converts the variable "Date" into a Date object in R. Take a look at the variable DateConvert using the summary function.
# What is the month and year of the median date in our dataset? Enter your answer as "Month Year", without the quotes. 
# (Ex: if the answer was 2008-03-28, you would give the answer "March 2008", without the quotes.)
summary(DateConvert) # May 2006

# Now, let's extract the month and the day of the week, and add these variables to our data frame mvt. 
# We can do this with two simple functions. Type the following commands in R:
# mvt$Month = months(DateConvert)
# mvt$Weekday = weekdays(DateConvert)
mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
# This creates two new variables in our data frame, Month and Weekday, and sets them equal to the month and weekday values 
# that we can extract from the Date object. Lastly, replace the old Date variable with DateConvert by typing:
# mvt$Date = DateConvert
# Using the table command, answer the following questions.
# In which month did the fewest motor vehicle thefts occur?
mvt$Date = DateConvert
table(mvt$Month)
min(table(mvt$Month)) # February

# On which weekday did the most motor vehicle thefts occur?
table(mvt$Weekday)
max(table(mvt$Weekday)) # Friday

# Each observation in the dataset represents a motor vehicle theft, and the Arrest variable indicates whether an arrest was later made 
# for this theft. Which month has the largest number of motor vehicle thefts for which an arrest was made?
table(mvt$Month, mvt$Arrest) # January


