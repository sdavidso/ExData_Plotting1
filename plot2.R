data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
plot(data$Time, data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file = "plot2.png")
dev.off()


