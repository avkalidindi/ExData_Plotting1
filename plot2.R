if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

power_data <- subset(power_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)
power_data$DateTime <- strptime(paste(power_data$Date,power_data$Time), format = "%Y-%m-%d %T")

png("plot2.png", width = 480, height = 480)

plot(power_data$DateTime, power_data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()