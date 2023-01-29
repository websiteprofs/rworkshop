#Installing required libraries and packages:
install.packages('corrplot')
install.packages('tidyverse')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('qqplotr')
install.packages('RVAideMemoire')
install.packages('ggplot')
install.packages("TTR")
install.packages("forecast")
install.packages('moments')
install.packages('DataExplorer')
install.packages('psych')
library(qqplotr)
library(RVAideMemoire)
library(corrplot)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(TTR)
library(forecast)
library(moments)
library(DataExplorer)
library(psych)



# Data Preparation:
residentialenergyconsumption <- read.csv("Residential_Energy_Consumed_R.csv", header= TRUE)
residentialenergyconsumption$Continent <- as.factor(residentialenergyconsumption$Continent)
residentialenergyconsumption$Country <- as.factor(residentialenergyconsumption$Country)
names(residentialenergyconsumption)
head(residentialenergyconsumption)
tail(residentialenergyconsumption)
str(residentialenergyconsumption)
sum(is.na(residentialenergyconsumption))  # To check for missing value
plot_boxplot(residentialenergyconsumption, by = 'Year') #To test for outliers

# 4.1. Do a comprehensive descriptive statistical analysis (e.g., Mean, Median, Mode, Standard deviation, Skewness and Kurtosis) on the data.
describe(residentialenergyconsumption)
summary(residentialenergyconsumption)
sd(residentialenergyconsumption$Households.Energy.Consumption) #standard deviation
mean(residentialenergyconsumption$Households.Energy.Consumption) #mean
median(residentialenergyconsumption$Households.Energy.Consumption) #median
#Evaluating the shape of the distribution by plotting an Histogram and calculating skewness and kurtosis
hist(residentialenergyconsumption$Households.Energy.Consumption, labels = TRUE, col='steelblue') #The distribution appears to be left skewed since more values are concenterated to the right side of the distribution
#Calculate Skewness
skewness(residentialenergyconsumption$Households.Energy.Consumption) #The distribution is left skewed (with a value of -0.27) because more of the values are concentrated on the RHS of the distribution
#Calculate Kurtosis
kurtosis(residentialenergyconsumption$Households.Energy.Consumption) #The distribution is playkurtic (with a value of 2.15) which is less than "3" which is the kurtosis of a normal distribution. The distribution is said to have few and less extreme outliers than a normal distribution.
#Using boxplot to find the median, min, max, 1st and 3rd quartile(end of the box) and interquartile range
#boxplot(residentialenergyconsumption$Households.Energy.Consumption, data = residentialenergyconsumption, xlab="Residential Energy", ylab="Total Consumption",main="Energy consumed by households")
boxplot(Households.Energy.Consumption ~ Country, data = residentialenergyconsumption, xlab="Country", ylab="Total Residential Energy Consumption", main="Energy consumed by households")
boxplot(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Continent, data = residentialenergyconsumption, xlab="Continent", ylab="Total Residential Energy Consumption", main="Energy consumed by households")
#Categorizing and plotting Household energy consumed by country from 2010 to 2019
plot(density(residentialenergyconsumption$Households.Energy.Consumption))
residentialenergyconsumption_UK <- residentialenergyconsumption[residentialenergyconsumption$Country == "United Kingdom",]
residentialenergyconsumption_Europe <- residentialenergyconsumption[residentialenergyconsumption$Continent == "Europe",]
residentialenergyconsumption_NorthAmerica <- residentialenergyconsumption[residentialenergyconsumption$Continent == "North America",]
residentialenergyconsumption_Germany <- residentialenergyconsumption[residentialenergyconsumption$Country == "Germany",]
residentialenergyconsumption_France <- residentialenergyconsumption[residentialenergyconsumption$Country == "France",]
residentialenergyconsumption_Italy <- residentialenergyconsumption[residentialenergyconsumption$Country == "Italy",]
residentialenergyconsumption_Spain <- residentialenergyconsumption[residentialenergyconsumption$Country == "Spain",]
residentialenergyconsumption_Canada <- residentialenergyconsumption[residentialenergyconsumption$Country == "Canada",]
residentialenergyconsumption_Mexico <- residentialenergyconsumption[residentialenergyconsumption$Country == "Mexico",]
residentialenergyconsumption_Jamaica <- residentialenergyconsumption[residentialenergyconsumption$Country == "Jamaica",]
residentialenergyconsumption_Cuba <- residentialenergyconsumption[residentialenergyconsumption$Country == "Cuba",]
residentialenergyconsumption_United_States <- residentialenergyconsumption[residentialenergyconsumption$Country == "United States",]
residentialenergyconsumption_United_States
barplot(residentialenergyconsumption_UK$Households.Energy.Consumption, names.arg = residentialenergyconsumption_UK$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in UK")
barplot(residentialenergyconsumption_United_States$Households.Energy.Consumption, names.arg = residentialenergyconsumption_United_States$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in United States")
barplot(residentialenergyconsumption_Germany$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Germany$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Germany")
barplot(residentialenergyconsumption_France$Households.Energy.Consumption, names.arg = residentialenergyconsumption_France$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in France")
barplot(residentialenergyconsumption_Italy$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Italy$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Italy")
barplot(residentialenergyconsumption_Spain$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Spain$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Spain")
barplot(residentialenergyconsumption_Canada$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Canada$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Canada")
barplot(residentialenergyconsumption_Mexico$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Mexico$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Mexico")
barplot(residentialenergyconsumption_Jamaica$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Jamaica$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Jamaica")
barplot(residentialenergyconsumption_Cuba$Households.Energy.Consumption, names.arg = residentialenergyconsumption_Cuba$Year, col = rainbow(10), xlab="Year", ylab="Total Consumption", main="Energy consumed by households in Cuba")
describe(residentialenergyconsumption)



# 4.2. Do a correlation analysis for the indicators and evaluate the results in the context of your stated objectives.
#removing the categorical variable before carrying out correlation analysis
residentialenergyconsumption_corr <- residentialenergyconsumption %>% select(-Continent, -Country, -Year)
residentialenergyconsumption_corr
#Correlation Matrix rounded to 2 decimal place:
round(cor(residentialenergyconsumption_corr), digits = 2)
#Correlation matrix plot (Method 1)
corrplot(cor(residentialenergyconsumption_corr), method = 'number', type = 'upper')
#Correlation matrix plot (Method 2)
corrplot(cor(residentialenergyconsumption_corr))
#correlation between Households energy consumption and population of one person Household is high "0.61"


# 4.3. Do regression analysis. Explain why the selected regression techniques are appropriate for the selected variables and defined objectives and show if you’ve found any similar research in the literature.
# Steps to perform SLR
# Objectives: To examine the possible linear relationship between household energy consumption and population of one person household
model_1 <- lm (residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Population.of.one.Person.Household, residentialenergyconsumption_corr)
summary.lm(model_1)
#Visualise the fitted SLR line using a scatter plot
plot(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Population.of.one.Person.Household, col = 'blue', main = "Regression: Household energy consumption & Apartments with sinlge occupants", xlab = 'Apartments with single occupant', ylab = 'Household Energy Consumed')
#Adding a line
abline(model_1, col = 'red')
# Four Assumptions of the fitted SLR model
#1. Linearity: The relationship between X and Y must be linear as seen from the graph plotted above
#2. Residual independence: The plot should have a pattern where the red line is approximately horizontal at Zero
plot(model_1, 1)
#3. Normality of residuals: The observations should be near the line of the normal probability plot
plot(model_1, 2)
#4 Equal variances of the residuals(Homoscedasticity): The residuals should be randomly scattered around the red line with roughly equal variability at the fitted values
plot(model_1, 3)
# Report the result: Residential household energy consumption = 64,920 + (0.00629 x Population of one person Household)
# Steps to perform MLR
# Objectives: To find out which independent variables from the correlation matrix can explain better household energy consumption among the ten countries
# From the correlation matrix, the two Independent variables that have high correlation with residential house hold energy consumption are population of one person household, and Population of couples without children
model_2 <- lm (residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Population.of.one.Person.Household + residentialenergyconsumption$Population.of.Couples.without.Children, residentialenergyconsumption_corr)
summary(model_2)
# Since the Adjusted R-Square value for the MLR model did not increase significantly when more variables were added to create a MLR, it means the SLR model to predict residential energy consumption cannot be improved upon, and it is the best model for this scenario/observations.
# We can also see from the summary(model_2), the P values of he intercept and one person household have *** which shows these are the only important variable to predict the Model. Couples without children do not have the *** which shows it is not an important factor when predicting household energy consumption using the linear model. 



# 4.4. Do time series analysis. Explain why the selected techniques are better for the defined objectives and show if you’ve found any similar research in the literature.
residentialenergyconsumptioncuba <- read.csv("timeseries.txt", header = FALSE)
residentialenergyconsumptioncuba
#Converting to time series 
residentialenergyconsumptioncubatimeseries <- ts(residentialenergyconsumptioncuba, start = c(2010))
residentialenergyconsumptioncubatimeseries
plot.ts(residentialenergyconsumptioncubatimeseries)
#Decomposing the data: The observations only contains non seasonal data
residentialenergyconsumptioncubatimeseriesSMA2 <- SMA(residentialenergyconsumptioncubatimeseries, n=2)
residentialenergyconsumptioncubatimeseriesSMA2
plot.ts(residentialenergyconsumptioncubatimeseriesSMA2)

# Forecasting using exponential smoothing: used for short term forecast for the time series data
#Using Holt-winters Exponential smoothing: Additive model for observations with increasing or decreasing trend and no seasonality
residentialenergyconsumptioncubaforecasts <- HoltWinters(residentialenergyconsumptioncubatimeseries, gamma = FALSE)
residentialenergyconsumptioncubaforecasts
#Value of the sum-of-squared errors is
residentialenergyconsumptioncubaforecasts$SSE
#plotting the original timeseries(blackline) with the forecasted values(redline)
plot(residentialenergyconsumptioncubaforecasts)
#Making forecast for future times not covered by the original time series for 10 years
residentialenergyconsumptioncubaforecasts2 <- forecast(residentialenergyconsumptioncubaforecasts, h=10)
plot(residentialenergyconsumptioncubaforecasts2)
residentialenergyconsumptioncubaforecasts2



plotForecastErrors <- function(forecasterrors)
{
  # make a histogram of the forecast errors:
  mybinsize <- IQR(forecasterrors)/4 
  mysd	<- sd(forecasterrors)
  mymin <- min(forecasterrors) - mysd*5 
  mymax <- max(forecasterrors) + mysd*3
  # generate normally distributed data with mean 0 and standard deviation mysd
  mynorm <- rnorm(10000, mean=0, sd=mysd)
  mymin2 <- min(mynorm)
  mymax2 <- max(mynorm)
  if (mymin2 < mymin) { mymin <- mymin2 }
  if (mymax2 > mymax) { mymax <- mymax2 }
  # make a red histogram of the forecast errors, with the normally distributed data overlaid:
  mybins <- seq(mymin, mymax, mybinsize)
  hist(forecasterrors, col="red", freq=FALSE, breaks=mybins)
  # freq=FALSE ensures the area under the histogram = 1
  # generate normally distributed data with mean 0 and standard deviation mysd
  myhist <- hist(mynorm, plot=FALSE, breaks=mybins)
  # plot the normal curve as a blue line on top of the histogram of forecast errors:
  points(myhist$mids, myhist$density, type="l", col="blue", lwd=2)
}


#To check if the predictive model can be improved on
acf(residentialenergyconsumptioncubaforecasts2$residuals, lag.max = 10, na.action = na.pass)
Box.test(residentialenergyconsumptioncubaforecasts2, lag = 10, type = 'Ljung-Box')
#To check if forecast errors having constant variance over time, and are normally distributed with mean Zero.
plot.ts(residentialenergyconsumptioncubaforecasts2$residuals)
residentialenergyconsumptioncubaforecasts2$residuals <- residentialenergyconsumptioncubaforecasts2[!is.na(residentialenergyconsumptioncubaforecasts2$residuals)]
plotForecastErrors(residentialenergyconsumptioncubaforecasts2$residuals)

#Forecasting using ARIMA Models
#remove the trend component in the ts , so we will only have the irregular component
auto.arima(residentialenergyconsumptioncubatimeseries)
acf(residentialenergyconsumptioncubatimeseries, lag.max=20)
acf(residentialenergyconsumptioncubatimeseries, lag.max=20, plot=FALSE)
pacf(residentialenergyconsumptioncubatimeseries, lag.max=20)
pacf(residentialenergyconsumptioncubatimeseries, lag.max=20, plot=FALSE)

#To check which ARIMA model to use
auto.arima(residentialenergyconsumptioncuba)
auto.arima(residentialenergyconsumptioncubatimeseries)
auto.arima(residentialenergyconsumptioncubatimeseriesSMA2)
acf(residentialenergyconsumptioncuba, lag.max = 10)
acf(residentialenergyconsumptioncuba, lag.max = 10, plot = FALSE)
ff <- arima(residentialenergyconsumptioncuba, order = c(0,0,0))
ff
ffforecasts <- forecast(ff, h=10)
ffforecasts
plot(ffforecasts)
acf(ffforecasts$residuals, lag.max = 10)
acf(ffforecasts$residuals, lag.max = 10, plot = FALSE)
Box.test(ffforecasts$residuals, lag = 10, type = 'Ljung-Box')


#Main Hypothesis testing:
#step 1: Test for normality of the data using either Q-Q plot(Visual method), Shapiro-Wilk Test, Kolmogorov-Smirnov test
#Q-Q Plot:
ggplot(mapping =aes(sample = residentialenergyconsumption$Households.Energy.Consumption)) + stat_qq_point(size = 2, color = 'blue') + stat_qq_line(color = 'orange') + xlab('Theoritical') + ylab('Sample')
#Shapiro-Wilk Test
shapiro.test(residentialenergyconsumption$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Canada$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Cuba$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_France$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Germany$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Italy$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Jamaica$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Mexico$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Spain$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_UK$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_United_States$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Europe$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_NorthAmerica$Households.Energy.Consumption)
#Kolmogorov-Smirnov Test
ks.test(residentialenergyconsumption$Households.Energy.Consumption, 'pnorm')

#Normalising the data:
residentialenergyconsumption$Households.Energy.Consumption_Germany_log <- log10(residentialenergyconsumption_Germany$Households.Energy.Consumption)
residentialenergyconsumption_Germany_log <- log10(residentialenergyconsumption_Germany$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Germany_log)
residentialenergyconsumption_Germany_root <- sqrt(residentialenergyconsumption_Germany$Households.Energy.Consumption)
shapiro.test(residentialenergyconsumption_Germany_root)
residentialenergyconsumption_Germany_cube <- residentialenergyconsumption_Germany$Households.Energy.Consumption^(1/3)
shapiro.test(residentialenergyconsumption_Germany_cube)
residentialenergyconsumption$Households.Energy.Consumption_root <- sqrt(residentialenergyconsumption$Households.Energy.Consumption)
residentialenergyconsumption$Households.Energy.Consumption_cube <- residentialenergyconsumption$Households.Energy.Consumption^(1/3)
describe(residentialenergyconsumption)


ggplot(mapping =aes(sample = residentialenergyconsumption$Households.Energy.Consumption_log)) + stat_qq_point(size = 2, color = 'blue') + stat_qq_line(color = 'orange') + xlab('Theoritical') + ylab('Sample')
shapiro.test(residentialenergyconsumption$Households.Energy.Consumption)
hist(residentialenergyconsumption$Households.Energy.Consumption, col='steelblue', main='Original')


#Non-parametric Hypothesis test using Mann-Whitney test (Europe and North America)
wilcox.test(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Continent, data=residentialenergyconsumption)

#Chi-square test of dependency
table(residentialenergyconsumption$Country, residentialenergyconsumption$Continent)
chisq.test(residentialenergyconsumption$Country, residentialenergyconsumption$Continent)
ggplot(residentialenergyconsumption) + aes(x = residentialenergyconsumption$Continent, fill = residentialenergyconsumption$Country) + geom_bar() + labs(title ="Residential Energy consumption by Continent and country", x = "Continents", y = "Count of Continents")



#ANOVA Testing:
#To compare the residential energy consumption in ten countries.(1-way ANOVA)
boxplot(Households.Energy.Consumption ~ Country, data = residentialenergyconsumption, xlab="Country", ylab="Total Residential Energy Consumption", main="Energy consumed by households") #Outlier detection test
byf.shapiro(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Country, data=residentialenergyconsumption)  #Normality test
bartlett.test(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Country, data=residentialenergyconsumption) #Hogoneity of variance test
oneway.test(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Country, var.equal = FALSE)  #Welch ANOVA Testing


#To compare the residential energy consumption in two continents.(1-way ANOVA)
boxplot(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Continent, data = residentialenergyconsumption, xlab="Continent", ylab="Total Residential Energy Consumption", main="Energy consumed by households") #Outlier detection test
byf.shapiro(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Continent, data=residentialenergyconsumption)  #Normality test
bartlett.test(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Continent, data=residentialenergyconsumption) #Hogoneity of variance test
oneway.test(residentialenergyconsumption$Households.Energy.Consumption ~ residentialenergyconsumption$Continent, var.equal = FALSE)  #Welch ANOVA Testing



