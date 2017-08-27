##########################################################
### DATA SCIENCE SPECIALIZATION
### EXPLORATORY DATA ANALYSIS (4/10)
### John Hopkins University
### Programming Exercice 1
### Plot 4
##########################################################

### 1. LIBRARIES
### Note: Code requires the dplyr package
### Used functions filter() and select()
install.packages("dplyr")  # No need to read this if dplyr is dowloaded
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
png('plot4.png')
par(mfrow = c(2,2))
par(mar = c(4,4,4,3))

# b) Plot 1
x = as.POSIXct(TIME, format="%d/%m/%Y %H:%M:%S")
y = as.numeric(as.character(GAP))
plot(x,y, type = 'line', ylab='Global active power (kilowatts)', xlab='')

# c) Plot 2
VOLT = select(df, Voltage) %>% unlist
VOLT = as.numeric(as.character(VOLT))
y = as.numeric(as.character(VOLT))
plot(x, y, type = 'l', ylab='Voltage', xlab='datetime')

# d) Plot 3
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
                  'Sub_metering_3'), bty='n', cex=0.5)

# e) Plot 4
GRP = select(df, Global_reactive_power) %>% unlist
GRP = as.numeric(as.character(GRP))
y = as.numeric(as.character(GRP))
plot(x, y, type = 'l', ylab='Global_reactive_power', xlab='datetime')

dev.off()