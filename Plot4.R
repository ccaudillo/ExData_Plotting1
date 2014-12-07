# Read the data
powerc <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")
# Filtering the data
power <- subset(powerc, powerc$Date == "1/2/2007" | powerc$Date == "2/2/2007" )
#Merging Date & Time fields
power$dati <- paste(power$Date, power$Time)
#Plotting
par(mfrow = c(2,2))

plot(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"), y=power$Global_active_power, col="black", type="l", xlab = "", ylab="Global Active Power (kilowatts)")

plot(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"), y=power$Voltage, col="black", type="l", xlab = "datetime", ylab="Voltage")

plot(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"),y=power$Sub_metering_1, col = "black", type = "l", xlab = "", ylab="Energy sub metering")
lines(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"),y=power$Sub_metering_2, col = "red", type = "l", xlab = "", ylab="")
lines(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"),y=power$Sub_metering_3, col = "blue", type = "l", xlab = "", ylab="")
legend("topright", ,lwd=1, bty = "n", cex=0.4, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"), y=power$Global_reactive_power, col="black", type="l", xlab = "datetime", ylab="Global_Reactive_Power")

dev.copy(png, file = "plot4.png", width = 480, height = 480 ) ## Copy my plot to a PNG file
dev.off() ## Closing the PNG device!