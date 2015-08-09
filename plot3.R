data <- read.table("household_power_consumption.txt", 
                   sep=";", header = TRUE, na.strings = "?")
data <- subset(data, (data$Date=="1/2/2007")|(data$Date=="2/2/2007"))
data$dt <- strptime(paste(as.character(data$Date), 
                          as.character(data$Time)), 
                    "%d/%m/%Y %H:%M:%S")
##reading data, subsetting right days, merging date and time


png(file="plot3.png", width=450, height=450) 
##making pdf file with resolution

with(data, plot(as.POSIXct(dt), Sub_metering_1, type="n",
                ylab="Energy sub metening", xlab=""))
with(data, lines(as.POSIXct(dt), data$Sub_metering_1))
with(data, lines(as.POSIXct(dt), data$Sub_metering_2, col="red"))
with(data, lines(as.POSIXct(dt), data$Sub_metering_3, col="blue"))
legend("topright", lwd=c(2,2,2), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"))
dev.off()
## making empty plot and sequently adding coloured lines and legend
