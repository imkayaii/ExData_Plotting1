## download and unzip data to working directory

## load "data.table" package
library(data.table)

## read dataset into R
data_file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(data_file),value = TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## create plot 2 figure
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ## convert Data format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) ## convert Time format
png(filename = "plot2.png", width = 480, height = 480, units = "px")
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
dev.off()

