data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
data <- subset(data, (data$Date=="1/2/2007")|(data$Date=="2/2/2007"))
data$dt <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")


plot(data$Global_active_power~as.POSIXct(data$dt), type="l", ylab="Global Active Power(kilowatts)", xlab=" ")


dev.copy(png, file="plot2.png")
dev.off()