if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

power_data <- subset(power_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
power_data$Sub_metering_1 <- as.numeric(power_data$Sub_metering_1)
power_data$Sub_metering_2 <- as.numeric(power_data$Sub_metering_2)
power_data$Sub_metering_3 <- as.numeric(power_data$Sub_metering_3)
power_data$DateTime <- strptime(paste(power_data$Date,power_data$Time), format = "%Y-%m-%d %T")

png("plot3.png", width = 480, height = 480)

plot.new()
plot(power_data$DateTime, power_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "")
lines(power_data$DateTime, power_data$Sub_metering_2, col = "red")
lines(power_data$DateTime, power_data$Sub_metering_3, col = "blue")

title(xlab = "", ylab = "Energy Sub metering")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

dev.off()