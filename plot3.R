##########################################################
### DATA SCIENCE SPECIALIZATION
### EXPLORATORY DATA ANALYSIS (4/10)
### John Hopkins University
### Programming Exercice 1
### Plot 3
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
png('plot3.png')
# b) Line Plot
par(mfrow = c(1,1))
y1 = select(df, Sub_metering_1) %>% unlist
y2 = select(df, Sub_metering_2) %>% unlist
y3 = select(df, Sub_metering_3) %>% unlist

x = as.POSIXct(TIME, format="%d/%m/%Y %H:%M:%S")
y1 = as.numeric(as.character(y1))
y2 = as.numeric(as.character(y2))
y3 = as.numeric(as.character(y3))

plot(x, y1, type = 'line', ylab='Energy sub metering', xlab='', col='black')
lines(x, y2, type="line", col="red")
lines(x, y3, type="line", col="blue")

legend('topright', lwd=2, col=c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2',
                  'Sub_metering_3'), bty='n')
dev.off()