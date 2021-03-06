#Read and Clean Data
Data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=TRUE, 
                   stringsAsFactors =FALSE)

Data1 <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]
#str(Data1)

DateTime <- strptime(paste(Data1$Date, Data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(Data1$Global_active_power)
GlobalReactivePower <- as.numeric(Data1$Global_reactive_power)
GlobalIntensity <- as.numeric(Data1$Global_intensity)
Voltage <- as.numeric(Data1$Voltage)
SubMetering1 <- as.numeric(Data1$Sub_metering_1)
SubMetering2 <- as.numeric(Data1$Sub_metering_2)
SubMetering3 <- as.numeric(Data1$Sub_metering_3)


##plot 4
png("plot4.png", width=480, height=480)
Sys.setlocale("LC_ALL", "English")
par(mfrow = c(2,2))
plot(DateTime, GlobalActivePower, type = "l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(DateTime, Voltage, type = "l",
     xlab="DateTime", 
     ylab="Voltage")

plot(DateTime, SubMetering1, type = "l",
     xlab="", 
     ylab="Energy sub metering")+
  lines(DateTime, SubMetering2, type = "l", col = "red")+
  lines(DateTime, SubMetering3, type = "l", col = "blue")
legend("topright",lty = 1,lwd=0.5,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(DateTime, GlobalReactivePower, type = "l",
     xlab="DateTime", 
     ylab="Global_reactive_power")

dev.off()