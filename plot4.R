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
png(filename = "Plot4.png")
par(mfcol=c(2,2))

#Plot 1
plot(power$time, power$Global_active_power, type="l", xlab="",
ylab="Global Active Power (kilowatts)")

#Plot 2
plot(power$timestamp,power$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(power$timestamp,power$Sub_metering_2, col="red")
lines(power$timestamp,power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                            "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
# Plot 3
plot(power$timestamp, power$Voltage,type="l",xlab="datetime", ylab="Voltage")

# Plot4
plot(power$timestamp, power$Global_reactive_power, type="l",  xlab="datetime",
     ylab="Global_reactive_power")
dev.off()