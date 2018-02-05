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


##plot 1
png(filename ="plot1.png", width = 480, height = 480)
hist(GlobalActivePower, 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power",
     col="red")
dev.off()