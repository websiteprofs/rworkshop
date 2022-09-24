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
