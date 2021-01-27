#1). Calculate the following:
#a). with and without loop
total <- 0
a <- 5:100
for (i in a){
  total <- total + (i**4 + 5*i**3)
}
total #2177844976

sum(a**4 + 5*a**3)

#b). Calculate U40
n <- 40
u <- 1:2
for (i in 3:n){
  u <- append(u, u[i-1] + u[i-2])
}
u[n]

#c). write a program to calculate cosx, sinx
library(pracma)
x <- as.numeric(readline(prompt = "Enter x: "))
n = 45
taylor(cos, x, n)
taylor(sin, x, n)

#d). Create a vector of the values of e**x * cos(x)
x <- seq(3, 6, by=0.1)
resultD <- exp(x) * cos(x)
resultD

#e). Find number of x divisible by 2
x <- 1:300
count <- 0
for (i in x){
  if(i %% 2 == 0){
    count <- count + 1
  }
}
count

#2). Solve the following system of linear equations using Gaussian elemination
library(matlib)
left = matrix(c(1, 2, 3,
                2, -1, 2,
                3, 3, 1), 3, 3)
right = c(9, -3, 5)
left
right
result2 <- gaussianElimination(left, right)
paste("x =",result2[10],", y =",result2[11],", z =",result2[12])

#3). Use outer function to create the following matrix
r <- 0:4
c <- 0:4
outerMatrix <- outer(c, r, "+")
outerMatrix

#4). Report the following information
#a). Data Source detail
# URL: https://data.opendevelopmentmekong.net/library_record/coronavirus-covid-19-cambodia-cases
#b). Explain each variable
#-- nationality_en: where patient come from
#-- provice_en: where patient from infected
#-- gender_en: gender of patient
#-- age: age of patient
#-- reinfected: how many time patient infected again after recovery
#-- reinfected_date: date of reinfection
#-- recovered: 1 recovered and 0 is not recovered yet
#-- death: 1 died and 0 is not
#-- recovered_date: date of recovered
#-- localtrans: 1 is from local and 0 is from import
#-- foreigntrans: 1 is from import and 0 is from local
#-- active: 1 is active and 0 is not active
#-- created_at: date of create record
#-- modified_at: date of last update record

#c). Find missing values and replace them with mean tidy Dataset
covidData <- read_csv("COVID_19 dashboard - OriginENcopy.csv")
covidData[] <- lapply(covidData, function(d) { 
  d[is.na(d)] <- mean(d, na.rm = TRUE)
  d
})
covidData

#d). Generate the two new variables(mean, mediam)
covidData %>% mutate(averageAge = mean(age), mostinfected = median(province_en))

#e). Rename the two existing variables 
covidData %>% rename(nationality = nationality_en, gender = gender_en)

#f). Create a plot using following instructions
# i). Choose x and y axis(aes)
data <- covidData %>% count(nationality_en, wt = infected)
# x is nationality_en and y is number of infected
data

# ii). geom_point() - specify the parameters, size : 5, color: red, alpha: 1⁄5
library(ggplot2)
geomPoint = geom_point(alpha = 1/5, color = "red", size = 5)
graph <- ggplot(data, mapping = aes(x = .data[["nationality_en"]], y = .data[["n"]])) + geomPoint
graph

# iii). use facet grid, cartesian coordinates and geom_smooth
graph + facet_grid(.data[["infected"]])
graph + coord_cartesian(expand = FALSE)
graph + geom_smooth()

# iv). Assign the title to x, y and graph 
graph <- graph + ggtitle("Number of cases of Covid19 in Cambodia") +
  xlab("Nationality") + ylab("Number of Cases")
graph

# v). Export the graph to your working directory with the title called “covid_19_dataset.png”
ggsave(filename = "./covid_19_dataset.png", units = "cm", width = 25, height = 25)





















































































































































































































































