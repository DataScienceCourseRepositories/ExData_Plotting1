data = read.table("../UC_IRVINE/household_power_consumption.txt",
                  sep=";",
                  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity",
                                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  fill=TRUE,
                  skip = 1,
                  strip.white = TRUE)
filterdByTimeData <- data[data$Date == "1/2/2007"| data$Date == "2/2/2007",]
time <- strptime(paste(filterdByTimeData$Date, filterdByTimeData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(filterdByTimeData$Sub_metering_1)
sub2 <- as.numeric(filterdByTimeData$Sub_metering_2)
sub3 <- as.numeric(filterdByTimeData$Sub_metering_3)
voltage <-as.numeric(filterdByTimeData$Voltage)
activePower <-as.numeric(filterdByTimeData$Global_active_power)
reactivePower <-as.numeric(filterdByTimeData$Global_reactive_power)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(time, activePower, type="l", ylab="Global Active Power")
plot(time, voltage, type="l", ylab="Voltage", xlab="datetime")
plot(time, sub1, type="l", ylab="Energy sub metering")
lines(time, sub2, type="l", col="red")
lines(time,sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=3)
plot(time, reactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()