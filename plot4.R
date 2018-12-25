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

png(filename = "plot4.png",
    width = 480, height = 480, units = "px") 
par(mfrow = c(2, 2))
with(data,plot(datetime,Global_active_power, type="l", xlab="",ylab="Global Active Power"))
with(data,plot(datetime,Voltage, type="l"))
with(data, plot(datetime,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
lines(data$datetime,data$Sub_metering_1,col="black")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")

legend("topright", lty=1,col = c("black", "red","blue"), legend=c("Sub_metering_1",
"Sub_metering_2","Sub_metering_3"))
with(data,plot(datetime,Global_reactive_power, type="l"))

dev.off()
