# Loading the dataset

textFile<-"./data/household_power_consumption.txt"
data<-read.table(textFile,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE,dec=".")

# Subsetting the data

subData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Formatting the data

dateTime<-strptime(paste(subData$Date,subData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(subData$Global_active_power)
GRP<-as.numeric(subData$Global_reactive_power)
Volt<-as.numeric(subData$Voltage)
SM1<-as.numeric(subData$Sub_metering_1)
SM2<-as.numeric(subData$Sub_metering_2)
SM3<-as.numeric(subData$Sub_metering_3)

# Plotting the data

png("Plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(dateTime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(dateTime, Volt, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, SM1, type="l", xlab = "", ylab = "Energy sub metering")
lines(dateTime,SM2, type="l",col="red")
lines(dateTime,SM3, type="l",col="blue")
legend("topright",c("Sub-Metering 1", "Sub-Metering 2","Sub-Metering 3"),lty=1,lwd=2.5,col=c("black","red","blue"))

plot(dateTime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
