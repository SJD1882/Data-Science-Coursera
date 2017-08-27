##########################################################
### DATA SCIENCE SPECIALIZATION
### EXPLORATORY DATA ANALYSIS (4/10)
### John Hopkins University
### Programming Exercice 1
### Plot 1
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

### 3. PLOT
# a) Set-up png file
png('plot1.png')
# b) Histogram
par(mfrow = c(1,1))
GAP = select(df, Global_active_power) %>% unlist
GAP = as.numeric(as.character(GAP))
hist(GAP, col = 'red', main = 'Global active power',
     xlab = 'Global active power (kilowatts)')

dev.off()