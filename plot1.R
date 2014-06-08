data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
hist(data$Global_active_power, col="Red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file = "plot1.png")
dev.off()
