##########################################################
### DATA SCIENCE SPECIALIZATION
### EXPLORATORY DATA ANALYSIS (4/10)
### John Hopkins University
### Programming Exercice 1
### Plot 2
##########################################################

### 1. LIBRARIES
### Note: Code requires the dplyr package
### Used functions filter() and select()
install.packages("dplyr")  # No need to read this if dplyr dowloaded
library(dplyr)

### 2. DATA
# a) English Time
Sys.setlocale(category = "LC_TIME", locale = "C")
# b) Load Data
setwd("C:/Users/SJD/Desktop")
DF = read.table(file = 'household_power_consumption.txt',
                header = TRUE, sep = ";", na.strings = '?')
# c) Filter relevant data: 01/02/2007 -> 02/02/2007
dates = c('1/2/2007', '2/2/2007')
df = filter(DF, Date %in% dates)
# d) Time series
DATE = as.character(df$Date)
TIME = as.character(df$Time)
TIME = paste(DATE, TIME)

### 3. PLOT
# a) Set-up png file
png('plot2.png')
# b) Line Plot
x = as.POSIXct(TIME, format="%d/%m/%Y %H:%M:%S")
y = as.numeric(as.character(GAP))
plot(x,y, type = 'line', ylab='Global active power (kilowatts)', xlab='')
dev.off()