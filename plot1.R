## R script plot1.R

## Import .txt file from default repository
householdpower = read.table("household_power_consumption.txt", sep=";", header=T)

## Change Date column format to date format
householdpower$Date <- as.Date(householdpower$Date, format = "%d/%m/%Y")

## Only keep data from the dates 2007-02-01 and 2007-02-02
## Load the result to a new dataset HHP
HHP <- subset(householdpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change Global_active_power column format to numeric
HHP$Global_active_power <- as.numeric(as.character(HHP$Global_active_power))

## Build the histogram and the .png file
png("plot1.png")
hist(HHP$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()  
