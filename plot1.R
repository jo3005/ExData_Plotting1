library(lubridate)

#read in the file from the working directory
household_power_consumption <- read.csv("C:/Users/jo/Dropbox/Coursera/Exploratory Analysis/Week 1 Asst/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#change the format of the dates to make sure the correct dates are being read
household_power_consumption$Date <- dmy(household_power_consumption$Date)

#subset the data to only consider the first two days in Feb 2007
power_data<-subset(household_power_consumption,household_power_consumption$Date==dmy("01/02/2007") | household_power_consumption$Date == dmy("02/02/2007"))

#remove the original file to free up memory
rm(household_power_consumption)

#plot the histogram
hist(power_data$Global_active_power,breaks=round(max(power_data$Global_active_power[!is.na(power_data$Global_active_power)]),0)*2,
     col="red",
     freq=TRUE,
     xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

#export it to the working directory
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()
