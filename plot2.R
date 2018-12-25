setwd("C:\\Users\\user\\Google Drive\\graphs in R")

data=read.table("household_power_consumption.txt", sep = ";", header=TRUE,
,na.strings = "?")
names(data)
nrow(data)
data=subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
nrow(data)
data$Date1=as.Date(data$Date,"%d/%m/%Y")
x=paste(data$Date1,data$Time) 
data$datetime <-  strptime(x,"%Y-%m-%d %H:%M:%S" , tz="GMT")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px") 

plot(data$datetime,data$Global_active_power,
ylab = "Global Active Power (kilowatts)", xlab="",type="n")
lines(data$datetime,data$Global_active_power)
title(main="Global Active Power")

dev.off()
