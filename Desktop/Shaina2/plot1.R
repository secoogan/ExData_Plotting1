data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")
hist(as.numeric(as.character(data1$Global_active_power)), 
          col = "red", 
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)")
dev.copy(png, 'plot1.png')
dev.off()