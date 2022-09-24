x <- c(4, 8, 23, 2, 16, 7)
x
mean(x)
x
median(x)
length(x)
range(x)
sd(x)
var(x)
summary(x)
<<<<<<< HEAD
x
pulse <- c(120, 134, 152)
exercise_level <- c("light", "intense", "intense")
time_in_mins <- c(30, 20, 20)
exercise_dataframe <- data.frame(pulse, exercise_level, time_in_mins)
print(exercise_dataframe)
summary(exercise_dataframe)
exercise_dataframe$exercise_level <-
  as.factor(exercise_dataframe$exercise_level)
summary(exercise_dataframe)
exercise_dataframe[1,3]
exercise_dataframe[,3]
exercise_dataframe[1,]
exercise_dataframe[1:2,2:3]
exercise_dataframe[,-3]
print(exercise_dataframe)
exercise_dataframe$pulse > 130
exercise_dataframe[exercise_dataframe$pulse > 130,]
completed_training <- c(1, 0, 1)
exercise_dataframe[completed_training==1,]
exercise_dataframe[completed_training==0,]
data()
cars
summary(cars)
plot(cars)
hist(cars$speed)
hist(cars$dist)
plot(density(cars$speed))
plot(density(cars$dist))
Thai_tourist <- read.csv("C:/Users/GODFREY/Documents/Workshop/R Workshop/Week 1/Thaitourism1.csv", header= TRUE)
Thai_tourist
names(Thai_tourist)
head(Thai_tourist)
str(Thai_tourist)
summary(Thai_tourist)
Thai_tourist_full <- read.csv("C:/Users/GODFREY/Documents/Workshop/R Workshop/Week 1/Thaitourism2.csv", header= TRUE)
Thai_tourist_full
Thai_2016<-Thai_tourist[Thai_tourist$Year==2016,]
Thai_2016
Thai_UK <- Thai_tourist_full[Thai_tourist_full$nationality=="UnitedKingdom",]
Thai_UK
barplot(Thai_2016$Tourists_1000s, names.arg = Thai_2016$Region, col = rainbow(8))
hist(Thai_UK$tourists, labels = TRUE, col = rainbow(8), xlab="No. of UK Tourists per month")
