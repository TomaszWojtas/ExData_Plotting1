data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
data$Date  <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, (data$Date=="2007-02-01")|(data$Date=="2007-02-02"))
data

hist(data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()
