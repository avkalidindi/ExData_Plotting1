if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

power_data <- subset(power_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(power_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()