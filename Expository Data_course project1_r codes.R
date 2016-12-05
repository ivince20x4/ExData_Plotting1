+data/
+.RDataTmp
+.Rhistory
+.RData

fileURL = "household_power_consumption.txt"
powerdata = read.table(fileURL,sep=";",header=TRUE)

#Use the lubridate package to reformat the date column
##install.packages("lubridate")
library(lubridate)
powerdata$Date = dmy(powerdata$Date)


##Just get the dates: 2007-02-01 and 2007-02-02
powerdatasub = powerdata[(powerdata$Date == ymd(20070201) 
                          | powerdata$Date == ymd(20070202)),]

##Remove original data from memory
##rm(powerdata)

##Plot the histogram

png("plot1.png",width=480,height=480,res=72)
hist(as.numeric(powerdatasub$Global_active_power)/500,
     xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power", col="red")
dev.off()

fileURL = "household_power_consumption.txt"
powerdata = read.table(fileURL,sep=";",header=TRUE)

#Use the lubridate package to reformat the date column
##install.packages("lubridate")
library(lubridate)
powerdata$Date = dmy(powerdata$Date)

##Paste date and time into 
powerdata$DateTime = paste(powerdata$Date,powerdata$Time)


##Just get the dates: 2007-02-01 and 2007-02-02
powerdatasub = powerdata[(powerdata$Date == ymd(20070201) 
                          | powerdata$Date == ymd(20070202)),]
temp = format(powerdatasub$DateTime,format="%d/%m/%Y %H %m %s")
powerdatasub$DateTime = strptime(temp,"%Y-%m-%d %H:%M:%S")


##Remove original data from memory
##rm(powerdata)

##Print plot to png file
png("plot2.png",width=480,height=480,res=72)
plot(powerdatasub$DateTime,as.integer(powerdatasub$Global_active_power)/500,type="l",ylab =
       "Global Active Power (Kilowtts)",xlab="")

dev.off()
    
fileURL = "household_power_consumption.txt"
powerdata = read.table(fileURL,sep=";",header=TRUE)

#Use the lubridate package to reformat the date column
##install.packages("lubridate")
library(lubridate)
powerdata$Date = dmy(powerdata$Date)

##Paste date and time into new variable
powerdata$DateTime = paste(powerdata$Date,powerdata$Time)


##Just get the dates: 2007-02-01 and 2007-02-02
powerdatasub = powerdata[(powerdata$Date == ymd(20070201) 
                          | powerdata$Date == ymd(20070202)),]
temp = format(powerdatasub$DateTime,format="%d/%m/%Y %H %m %s")
powerdatasub$DateTime = strptime(temp,"%Y-%m-%d %H:%M:%S")


##Print out plot to png file
png("plot3.png",width=480,height=480,res=72)
plot(powerdatasub$DateTime,as.integer(powerdatasub$Sub_metering_1),type="l",ylab =
       "Energy Sub metering",xlab="",yaxt="n")
lines(powerdatasub$DateTime,as.integer(powerdatasub$Sub_metering_2)/8,col="red")
lines(powerdatasub$DateTime,as.integer(powerdatasub$Sub_metering_3),col="blue")

legend("topright",col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3"),lwd=1,cex=.85)
ticks = c(0,10,20,30)
axis(side=2, at = ticks)
dev.off()

#Use the lubridate package to reformat the date column
##install.packages("lubridate")
library(lubridate)
powerdata$Date = dmy(powerdata$Date)

##Paste date and time into new variable
powerdata$DateTime = paste(powerdata$Date,powerdata$Time)


##Just get the dates: 2007-02-01 and 2007-02-02
powerdatasub = powerdata[(powerdata$Date == ymd(20070201) 
                          | powerdata$Date == ymd(20070202)),]
temp = format(powerdatasub$DateTime,format="%d/%m/%Y %H %m %s")
powerdatasub$DateTime = strptime(temp,"%Y-%m-%d %H:%M:%S")


##Print plots to png file
png("plot4.png")
par(mfrow=c(2,2))


##First plot
plot(powerdatasub$DateTime,as.integer(powerdatasub$Global_active_power)/500,type="l",ylab =
       "Global Active Power (Kilowtts)",xlab="")

##Second plot
plot(powerdatasub$DateTime,as.integer(powerdatasub$Voltage)/8,
     type = "l",ylab="Voltage",xlab="datetime")

##Third plot
plot(powerdatasub$DateTime,as.integer(powerdatasub$Sub_metering_1),type="l",ylab =
       "Energy Sub metering",xlab="",yaxt="n")
lines(powerdatasub$DateTime,as.integer(powerdatasub$Sub_metering_2)/8,col="red")
lines(powerdatasub$DateTime,as.integer(powerdatasub$Sub_metering_3),col="blue")

legend("topright",col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3"),lwd=1,cex=.85,bty="n")
ticks = c(0,10,20,30)
axis(side=2, at = ticks)


##Fourth plot
plot(powerdatasub$DateTime,as.integer(powerdatasub$Global_reactive_power)/400,
     type = "l",xlab="datetime",ylab="Global_reactive_power",yaxt="n")
ticks = c(0.0,0.1,0.2,0.3,0.4,0.5)
axis(side=2, at = ticks, cex.axis=0.9)

dev.off()