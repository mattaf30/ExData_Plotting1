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

#plot 3
#opens png file device and names file
png(file="plot3.png", width=480, height=480)
#creats black data template
plot(epower2$newtime, epower2$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
#plots first set of data
lines(epower2$newtime, epower2$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="",col="black")
#plots second set of data
lines(epower2$newtime, epower2$Sub_metering_2, ylab="Energy sub metering", type="l", xlab="",col="red")
#plots third set of data
lines(epower2$newtime, epower2$Sub_metering_3, ylab="Energy sub metering", type="l", xlab="",col="blue")
#creates legend for graph
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black", "red", "blue"))
#closes png file device
dev.off()

