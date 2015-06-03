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

#create plot
png(filename = "Plot1.png")
hist(power$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()
