##3rd plot
## reading, naming, subsetting the data
hp <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(hp) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering3_")
subhp <- subset(hp, hp$Date == "1/2/2007" | hp$Date == "2/2/2007")


## converting Time and Date vars into Date and POSIXit (character to Date and POSIXit)
subhp$Date <- as.Date(subhp$Date, format="%d/%m/%Y")
subhp$Time <- strptime(subhp$Time, format="%H:%M:%S")
subhp[1:1440,"Time"] <- format(subhp[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subhp[1441:2880,"Time"] <- format(subhp[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
plot(subhp$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subhp,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subhp,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subhp,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

png("plot3.png", width=480, height=480)
dev.off()
