# Read the data
powerc <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")
# Filtering the data
power <- subset(powerc, powerc$Date == "1/2/2007" | powerc$Date == "2/2/2007" )
#Histogram
hist(power$Global_active_power, col = "red", main = "Global Active Power (kilowatts)", xlab="Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480 ) ## Copy my plot to a PNG file
dev.off() ## Closing the PNG device