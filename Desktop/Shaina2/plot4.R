require(chron)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")
datadur <- chron(as.character(data1$Date), data1$Time, 
                 format = c(dates = "y-m-d", times = "h:m:s"))
par(mfcol = c(2,2))
myplot <- plot(x <- datadur, y <- as.numeric(as.character(data1$Global_active_power)), 
               type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at= c(13545, 13546, 13547),
     labels = c("Thursday", "Friday", "Saturday"))
myplot2 <- plot(x <- datadur, y <- as.numeric(as.character(data1$Sub_metering_1)), 
               type = "l", xlab = "", ylab = "Energy sub metering", xaxt="n")
lines(datadur, as.numeric(as.character(data1$Sub_metering_2)), type ="l", col = "red")
lines(datadur, as.numeric(as.character(data1$Sub_metering_3)), type ="l", col = "blue")
axis(1, at= c(13545, 13546, 13547),
     labels = c("Thursday", "Friday", "Saturday"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c("black", "red", "blue"), bty = "n")
myplot3 <- plot(x <- datadur, y <- as.numeric(as.character(data1$Voltage)), 
                type = "l", xlab= "datetime", ylab = "Voltage", xaxt="n")
axis(1, at= c(13545, 13546, 13547),
     labels = c("Thursday", "Friday", "Saturday"))
myplot4 <- plot(x <- datadur, y <- as.numeric(as.character(data1$Global_reactive_power)), 
                type = "l", xlab= "datetime", ylab = "Global_reactive_time", xaxt="n")
axis(1, at= c(13545, 13546, 13547),
     labels = c("Thursday", "Friday", "Saturday"))
dev.copy(png, 'plot4.png')
dev.off()