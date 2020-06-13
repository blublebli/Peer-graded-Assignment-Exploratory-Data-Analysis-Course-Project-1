hp <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(hp) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subhp <- subset(hp, hp$Date == "1/2/2007" | hp$Date == "2/2/2007")

subhp$Date <- as.Date(subhp$Date, format="%d/%m/%Y")
subhp$Time <- strptime(subhp$Time, format="%H:%M:%S")
subhp[1:1440,"Time"] <- format(subhp[1:1440,"Time"],"2007-02-01 %H:%M:%S")

subhp[1441:2880,"Time"] <- format(subhp[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots which form the graph
with(subhp,{
        plot(subhp$Time,as.numeric(as.character(subhp$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(subhp$Time,as.numeric(as.character(subhp$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(subhp$Time,subhp$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(subhp,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(subhp,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(subhp,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(subhp$Time,as.numeric(as.character(subhp$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

png("plot4.png", width=480, height=480)
dev.off()
