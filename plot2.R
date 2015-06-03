#read in data
power <- read.table("household_power_consumption.txt", 
                    sep = ";", 
                    stringsAsFactors= FALSE,
                    header=TRUE,
                    na.strings= "?")

#transform dates
library(lubridate)
power$Date <- dmy(power$Date)

#subset dates to 2007-02-01 and 2007-02-02

library(dplyr)
startDate <- ymd("2007-02-01")
endDate <- ymd("2007-02-02")

power<- filter(power, Date >= startDate, Date <= endDate)

#create timestamp
power$timestamp <- paste(power$Date, power$Time)

#transform Timestamp
power$timestamp <-ymd_hms(power$timestamp)

#create plot
png(filename = "Plot2.png")
plot(power$time, power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()