setwd("C:\\Users\\user\\Google Drive\\graphs in R")

data=read.table("household_power_consumption.txt", sep = ";", header=TRUE,
,na.strings = "?")
names(data)
nrow(data)
data=subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
nrow(data)
png(filename = "plot1.png",
    width = 480, height = 480, units = "px") 

hist(data$Global_active_power,
ylab = "Frequency", xlab="Global Active Power (kilowatts)",col="red",
main="Global Active Power")



dev.off()
