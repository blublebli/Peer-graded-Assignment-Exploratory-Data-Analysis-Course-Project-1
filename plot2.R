## 2nd plot
## reading, naming, subsetting the data
hp <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subhp <- subset(hp, hp$Date == "1/2/2007" | hp$Date == "2/2/2007")


## converting Time and Date vars into Date and POSIXit (character to Date and POSIXit)
subhp$Date <- as.Date(subhp$Date, format="%d/%m/%Y")
subhp$Time <- strptime(subhp$Time, format="%H:%M:%S")
subhp[1:1440,"Time"] <- format(subhp[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subhp[1441:2880,"Time"] <- format(subhp[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## plotting
plot(subhp$Time,as.numeric(as.character(subhp$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")
png("plot2.png", width=480, height=480)
dev.off()