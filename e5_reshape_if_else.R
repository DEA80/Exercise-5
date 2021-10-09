#Exercise #5

#Practice the following skills:
  # reshape data frames
  # if_else statements

#Part 1: version control --------------------------------------------
# Please track changes to your script using version control. Include in your homework the URL to your completed homework assignment available on your
#GitHub repository

#URL: https://github.com/DEA80/Exercise-5

#Part 2: reshaping data frames ---------------------------------------------

#Using the 'batting.2008.Rdata' dataset, please do the following

load("batting.2008.Rdata")
library(tidyverse)

#1) Using the spread() function, please create a data frame that shows the total number of home runs (HR) for each birthYear for
  #each team (use the teamID column) aggregated by player

d1 = spread(d, birthYear, HR, 0)
ncol(d1)
HR = subset(d1, select = c(teamID, 31:56))
HR = HR %>% group_by(teamID) %>% summarise_all(.funs = sum)
HR

#2) Subset the data for the Houston Astros (HOU). Using the gather() function, create a new data frame that has 3 columns:
  # (1) playerID, (2) variable containing (AB, R, H, 2B, 3B) and (3) column with the corresponding values for the stats.

hou = subset(d, teamID == "HOU")
hou
houinfo = gather(hou, variable, stats, c("AB","R","H","2B","3B"))
houinfo
houinfo = subset(houinfo, select = c(playerID, variable, stats))
head(houinfo)

#3) Repeat the process for Question 2. However, this time, please use the melt() function from the 'reshape2' package.

library(reshape2)
hou2 = subset(d, teamID == "HOU")
hou2 = subset(hou2, select = c("playerID","AB", "R", "H", "2B", "3B"))
hou2
houinfo2 = melt(hou2, id.vars = c("playerID"))
head(houinfo2)

#4) Using the dcast() function from the 'reshape2 package', find the mean number of AB, R, H, 2B, 3B for each player (use 'playerID' to aggregate).

meanstats = dcast(data = d, formula = playerID~c("AB", "R", "H", "2B", "3B"), fun.aggregate = mean, fill = 0)
head(meanstats)
#Part 3: if_else statements -------------------------------

# one condition
#5) generate an if_else statment to test if the value of a numeric object is positive number
number = 82
if((number %% 2) == 0) {
  print("Even")
  } else {print("odd")}


#6) using the two objects below, please generate an if_else statement that uses logical operator (i.e, !=, ==, >, etc.)
  # in the test

    x <- 5
    y <- 8
    
    if (x > y) {
      print("X is greater")
    } else {
      print("X is not greater")
    }

#7) Hamlet's quandry: In Shakespeare's play Hamlet, the lead character has a famous speech "to be or not to be".
browseURL("https://www.poetryfoundation.org/poems/56965/speech-to-be-or-not-to-be-that-is-the-question")
# Write an if_else statement using the "to be' or 'not to be' for outcomes of the 'yes' and 'no' arguments respectively.

if(999e999 == Inf) {print("To be")
  } else {print("Not to be")}

#two or more conditions
#8) create an 'if else' statement that returns (in order of preference) your four ideal pizza toppings

toppings = "best"
if (toppings == "best") {print("Bacon, pepperoni, banana peppers, sausage")
  } else {print("sad")}

#two or more conditions joined (new content)
#To join two or more conditions into a single if statement, use logical operators viz. && (and), || (or) and ! (not).

  #example:
  x <- 7
  y <- 5
  z <- 2
  if(x > y && x > z) {
    print("x is greater")
  }

#9) generate your own 'if' statement using multiple conditions in one line
  
  a = 1
  b = 7
  c = 9
  
  if (a < c && b < c) {print("A and B are less than C")}



#New content: understanding a common warning/error message when using if_else.
# The follow set of code will generate a warning message. Explain in a comment what the warning is telling you.
  v <- 1:6

  if(v %% 2) {
    print("odd")
  } else {
    print("even")
  }
  
  #The warning is saying "v" has a length of more than one, since it contains numbers 1 to 6. It will only use the first value in "v" (1) when the if-else statement is run.

