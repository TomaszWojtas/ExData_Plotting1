data <- read.table("household_power_consumption.txt", 
                   sep=";", header = TRUE, na.strings = "?")
data <- subset(data, (data$Date=="1/2/2007")|(data$Date=="2/2/2007"))
## reading data and subsetting specific days

data$dt <- strptime(paste(as.character(data$Date), 
                          as.character(data$Time)), 
                    "%d/%m/%Y %H:%M:%S")
## merging date and time and transforming it to right format

png(file="plot4.png", width=450, height=450, res=80)
##output device and resolution

par(mfrow=c(2,2), mar=c(5,5,1,1))
##creating four places for four plots with margins

with(data, plot(as.POSIXct(data$dt),Global_active_power, 
                type="l", ylab="Global Active Power", 
                xlab=" "))
##this is top left plot, the same as plot2

with(data, plot(as.POSIXct(data$dt), Voltage, type="l", 
                xlab="datetime", ylab="Voltage"))


{
with(data, plot(as.POSIXct(dt), Sub_metering_1, type="n",
                ylab=" ", xlab=" "))
with(data, lines(as.POSIXct(dt), data$Sub_metering_1))
with(data, lines(as.POSIXct(dt), data$Sub_metering_2, col="red"))
with(data, lines(as.POSIXct(dt), data$Sub_metering_3, col="blue"))
legend("topright", lwd=c(2,2,2), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"), bty="n")
}
##third plot, just like plot 3 but without box of legend

with(data, plot(as.POSIXct(dt), Global_reactive_power, type="l", 
                xlab="datetime"))
##fourth, bottom right plot

dev.off()
## finishing the plot

