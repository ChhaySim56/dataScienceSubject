library("ggplot2")
library("dplyr")
library("knitr")
library("tidyverse")
library("rlang")
library("readxl")
library("qdap")
library("tokenizers")
library("syuzhet")
###########################################################################################################################
# 1). Write a program to generate 6*6 matrix (A) using a random number between 1 to 100 and another one (B) from 500 to 600
a <- matrix(sample(1:100, 36), 6, 6)
b <- matrix(sample(500:600, 36), 6, 6)

# a). Find range of matrix A and B
range(a)
range(b)

# b). Find max value from each row of A and B
aMaxRow <- apply(a, 1, max)
bMaxRow <- apply(b, 1, max)

# c). Find Diagonal of A&B
i <- a/b
diag(t(i))

# d). Multiply matrices A and B
a %*% b

# e). Replace the 4th row of matrix A with diagonal value of matrix B
a[4, ] <- diag(t(b))

# f). Mulitply matrix A & B and store value in x
x <- a %*% b

# e). divide matrix A & B
a / b

#########################################################################
# 2). Create a table using dataframe/tibble with the following categories 
# a. First name,
firstname <- c("Dara", "Daro", "Nita", "Devid", "Jo", "Matt", "Jack", "Don", "SOnny", "Biff")
# b. Second Name,
secondname <- c("Day", "Gunn", "Orson", "King", "Key", "Tree", "Pot", "Case", "Adam", "Warren")
# c. Age,
age = c(23, 32, 43, 52, 13 , 12 , 18, 29, 32, 66)
# d. Occupation,
occupation <- c("Engineer", "Teacher", "Scientist", "Doctor", "Lawyer", "Nurse", "Architect", "Consultant", "Mechanic", "Electrician")
# e. Place,
place <- c("Phnom Penh", "Kompot", "Phnom Penh", "Phnom Penh","Takea", "Kep", "Phnom Penh", "Phnom Penh", "Phnom Penh", "Prey Veng")
# f. Random numbers( between 1 to 10)
random <- sample(1:10, 10)


newData <- data.frame(Firstname=firstname, Secondname=secondname, Age=age, Occupation=occupation, Place=place, Random=random)
newData 
# g. Extract the last Column from the dataset
lastCol <- newData$Random
lastCol

# h, Find sum, mean, and length of extract column
sum(lastCol)
mean(lastCol)
length(lastCol)


############################################################################################
# 3). Create a .txt file
# link: https://www.phnompenhpost.com/national/mekong-levels-set-drop-during-power-grid-work
# a). read .text file
lastestNews <- read.delim("news.txt")
# b). Perform the tokenization and count the words
words <- paste0(lastestNews)
tokens <- tokenize_words(words)
numOfWords <- count_words(words)

# c). identify the most repeated word and replace that word with KIT
mostRepeatedWords <- names(table(tokens))[as.vector(table(tokens)) == max(table(tokens))]
mostRepeatedWords
numberOfReqeated <- max(table(tokens))
newArtical <- gsub(mostRepeatedWords, "KIT", tokens)
newArtical

# d). Perform statement analysis
sentimentAnalysis <- get_sentiment(tokens, method = "syuzhet")
summary(sentimentAnalysis)





###############################################################################################
# 4). Find the assigned Dataset from the list below and perform the following
# a. import and clean dataset
data <- read_csv("mad-men.csv")
data
# data is already clean
is.na(data)

# b). Find the x and y variables(axis) from the assigned dataset and give the reason for selecting the x and y axis.
plot <- ggplot(data, aes(x=Yearssince, y=Score)) + 
  xlab("Years Since") +
  ylab("Score")                                                                                   



