require(chron)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")
datadur <- chron(as.character(data1$Date), data1$Time, format = c(dates = "y-m-d", times = "h:m:s"))
myplot <- plot(x <- datadur, y <- as.numeric(as.character(data1$Global_active_power)), 
               type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at= c(13545, 13546, 13547),
     labels = c("Thursday", "Friday", "Saturday"))
dev.copy(png, 'plot2.png')
dev.off()
