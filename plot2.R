data = read.table("../UC_IRVINE/household_power_consumption.txt",
                  sep=";",
                  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity",
                                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  fill=TRUE,
                  skip = 1,
                  strip.white = TRUE)
filterdByTimeData <- data[data$Date == "1/2/2007"| data$Date == "2/2/2007",]
time <- strptime(paste(filterdByTimeData$Date, filterdByTimeData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power<- as.numeric(filterdByTimeData$Global_active_power)
png("plot2.png", width=480, height = 480)
plot(time, power, type="l", xlab="", ylab = " Global Active Power(kilowatts")
dev.off()