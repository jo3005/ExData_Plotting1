library(lubridate)

#read in the file from the working directory
household_power_consumption <- read.csv("C:/Users/jo/Dropbox/Coursera/Exploratory Analysis/Week 1 Asst/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#change the format of the dates to make sure the correct dates are being read
household_power_consumption$Date <- dmy(household_power_consumption$Date)

#subset the data to only consider the first two days in Feb 2007
power_data<-subset(household_power_consumption,household_power_consumption$Date==dmy("01/02/2007") | household_power_consumption$Date == dmy("02/02/2007"))

#remove the original file to free up memory
rm(household_power_consumption)

#change the format of the time data
power_data$Time<-hms(power_data$Time)

#combine dates and times into one field
power_data$DateTime<-as.POSIXlt(power_data$Date)
hour(power_data$DateTime) <- hour(power_data$Time)
minute(power_data$DateTime)<-minute(power_data$Time)
second(power_data$DateTime)<-second(power_data$Time)

                            

#plot the line plot
with(power_data,plot(x=DateTime,y=Global_active_power,
                     type="l",
                     ylab="Global Active Power",xlab=""
                     ))


#export it to the working directory
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()
