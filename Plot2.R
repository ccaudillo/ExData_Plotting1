# Read the data
powerc <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")
# Filtering the data
power <- subset(powerc, powerc$Date == "1/2/2007" | powerc$Date == "2/2/2007" )
#Merging Date & Time fields
power$dati <- paste(power$Date, power$Time)
#Plotting
plot(x=strptime(power$dati,"%d/%m/%Y %H:%M:%S"), y=power$Global_active_power, col="black", type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480 ) ## Copy my plot to a PNG file
dev.off() ## Closing the PNG device!
