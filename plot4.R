data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot4.png")

par(mfrow=c(2,2))

plot(data$Time, data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(data$Time, data$Voltage, type="l",ylab="Voltage",xlab="datetime")

plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub Metering")
lines(data$Time,data$Sub_metering_1)
lines(data$Time,data$Sub_metering_2, col="Red")
lines(data$Time,data$Sub_metering_3, col="Blue")
legend("topright", lty=1,col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(data$Time, data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()