# Loading the dataset

textFile<-"./data/household_power_consumption.txt"
data<-read.table(textFile,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE,dec=".")

# Subsetting the data

subData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Plotting the data

dateTime<-strptime(paste(subData$Date,subData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(subData$Global_active_power)
png("Plot2.png",width=480,height=480)
plot(dateTime, GAP, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
