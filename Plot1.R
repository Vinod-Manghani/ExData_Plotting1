# Loading data into console

textFile<-"./data/household_power_consumption.txt"
data<-read.table(textFile,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".", na.strings = "?")

# Subsetting the required dates

subData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plotting the data in histogram

GAP<-as.numeric(subData$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(GAP,col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
