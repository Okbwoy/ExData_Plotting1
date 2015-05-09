## R script plot3.R

## Import .txt file from default repository
householdpower = read.table("household_power_consumption.txt", sep=";", header=T)

## Change Date column format to date format
householdpower$Date <- as.Date(householdpower$Date, format = "%d/%m/%Y")

## Only keep data from the dates 2007-02-01 and 2007-02-02
## Load the result to a new dataset HHP
HHP <- subset(householdpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change Sub_metering_1 and Sub_metering_2 columns format to numeric
HHP$Sub_metering_1 <- as.numeric(as.character(HHP$Sub_metering_1))
HHP$Sub_metering_2 <- as.numeric(as.character(HHP$Sub_metering_2))

## Add date and time in order to use it on the x-axis
datetime <- paste(as.Date(HHP$Date), HHP$Time)

## Build the graph and the .png file
png("plot3.png")

## Plot all 3 time series
plot(as.POSIXct(datetime), HHP$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(as.POSIXct(datetime), HHP$Sub_metering_2, col = 'Red')
lines(as.POSIXct(datetime), HHP$Sub_metering_3, col = 'Blue')

## Add the legend
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
