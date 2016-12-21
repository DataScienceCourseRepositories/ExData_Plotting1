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
png("plot3.png", width=480, height=480)
plot(time, sub1, type='l', ylab="Energy sub metering", xlab = "", ylim=c(0,39))
lines(time, sub2, col="red", type="l")
lines(time, sub3, col= "blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=3)
dev.off()