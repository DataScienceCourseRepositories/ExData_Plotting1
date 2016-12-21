data = read.table("../UC_IRVINE/household_power_consumption.txt",
               sep=";",
               col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity",
                            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               fill=TRUE,
               skip = 1,
               strip.white = TRUE)
filterdByTimeData <- data[data$Date == "1/2/2007"| data$Date == "2/2/2007",]
gacd= as.numeric(filterdByTimeData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(gacd/1000, 
     main = "Global Active Power", 
     col="red", 
     xlab="Global Active Power (kilowatts)",
     xlim=c(0,6),
     ylab="Frequency")

dev.off()