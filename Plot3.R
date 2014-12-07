# Read the data
powerc <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")
# Filtering the data
power <- subset(powerc, powerc$Date == "1/2/2007" | powerc$Date == "2/2/2007" )
#Merging Date & Time fields
power$dati <- paste(power$Date, power$Time)
#Plotting
plot(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"),y=power$Sub_metering_1, col = "black", type = "l", xlab = "", ylab="Energy sub metering")
lines(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"),y=power$Sub_metering_2, col = "red", type = "l", xlab = "", ylab="")
lines(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"),y=power$Sub_metering_3, col = "blue", type = "l", xlab = "", ylab="")
legend("topright", ,lwd=1, lty=c(1:3), cex=0.7, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), adj = 0)

dev.copy(png, file = "plot3.png", width = 480, height = 480 ) ## Copy my plot to a PNG file
dev.off() ## Closing the PNG device!
