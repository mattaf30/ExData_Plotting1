setwd("~/Desktop/Exploratory Data Analysis/Project 1")

#reads in full data set
epower<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

#converts Date column to date
epower$Date<-as.Date(epower$Date, format="%d/%m/%Y")

#subsets dataset by selected dates
epower2<-subset(epower, Date>="2007-02-01" & Date<="2007-02-02")

#creates new column that is a combination of date and time columns and converts format
epower2$newtime<-paste(epower2$Date,epower2$Time)
epower2$newtime<-strptime(epower2$newtime, format='%Y-%m-%d %H:%M:%S')

#plot 4
#opens png file device and names file
png(file="plot4.png", width=480, height=480)
#creates 2 x 2 template for graphs to go in
par(mfrow=c(2,2))
#plots first graph in cell 1,1
plot(epower2$newtime, epower2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#plots second graph in cell 1, 2
plot(epower2$newtime, epower2$Voltage, ylab="Voltage", xlab="datetime", type="l")
#plots third graph in cell 2, 1
plot(epower2$newtime, epower2$Sub_metering_1, ylab="Energy Sub metering", xlab="", type="n")
lines(epower2$newtime, epower2$Sub_metering_1, ylab="Energy Sub metering", type="l", xlab="",col="black")
lines(epower2$newtime, epower2$Sub_metering_2, ylab="Energy Sub metering", type="l", xlab="",col="red")
lines(epower2$newtime, epower2$Sub_metering_3, ylab="Energy Sub metering", type="l", xlab="",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black", "red", "blue"))
#plots forth graph in cell 2, 2
plot(epower2$newtime, epower2$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
#closes png file device
dev.off()

