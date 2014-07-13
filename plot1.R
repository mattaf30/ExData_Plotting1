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


#plot1
#opens png file device and names file
png(file="plot1.png", width=480, height=480)
#plots histogram
hist(epower2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#closes png file device
dev.off()



