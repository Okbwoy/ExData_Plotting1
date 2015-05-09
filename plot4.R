## R script plot4.R

## Import .txt file from default repository
householdpower = read.table("household_power_consumption.txt", sep=";", header=T)

## Change Date column format to date format
householdpower$Date <- as.Date(householdpower$Date, format = "%d/%m/%Y")

## Only keep data from the dates 2007-02-01 and 2007-02-02
## Load the result to a new dataset HHP
HHP <- subset(householdpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change Gall relevant columns format to numeric
HHP$Global_active_power <- as.numeric(as.character(HHP$Global_active_power))
HHP$Global_reactive_power <- as.numeric(as.character(HHP$Global_reactive_power))
HHP$Voltage <- as.numeric(as.character(HHP$Voltage))
HHP$Sub_metering_1 <- as.numeric(as.character(HHP$Sub_metering_1))
HHP$Sub_metering_2 <- as.numeric(as.character(HHP$Sub_metering_2))

## Add date and time in order to use it on the x-axis
datetime <- paste(as.Date(HHP$Date), HHP$Time)

## Build the graph and the .png file
png("plot4.png")

## Create 4 quadrants
par(mfrow = c(2,2))

## Top Left graph
plot(as.POSIXct(datetime), HHP$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

## Top Right graph
plot(as.POSIXct(datetime), HHP$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

## Bottom Left graph
plot(as.POSIXct(datetime), HHP$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(as.POSIXct(datetime), HHP$Sub_metering_2, col = 'Red')
lines(as.POSIXct(datetime), HHP$Sub_metering_3, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Bottom Right graph
plot(as.POSIXct(datetime), HHP$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
