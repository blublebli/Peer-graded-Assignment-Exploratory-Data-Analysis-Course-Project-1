## setting the working directory
setwd("C:/Users/Standard/OneDrive/Desktop/Exploratory Analysis Project Week 1")

## reading, naming, subsetting the data
hp <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(hp) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering3_")
subhp <- subset(hp, hp$Date == "1/2/2007" | hp$Date == "2/2/2007")
## 1st plot
## basic plot function
hist(as.numeric(as.character(subhp$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts")
title(main="Global Active Power")
png("plot1.png", width=480, height=480)
dev.off()



