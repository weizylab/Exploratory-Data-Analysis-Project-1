data<- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_time<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_time$Date <- as.Date(data_time$Date, format="%d/%m/%Y")
t_date <- paste(as.Date(data_time$Date), data_time$Time)
data_time$daytime <- as.POSIXct(t_date)
plot(data_time$Sub_metering_1~data_time$daytime,type="l",ylab="Global Active Power (kilowatts)", xlab="")+
  lines(data_time$Sub_metering_2~data_time$daytime,col="red")+
  lines(data_time$Sub_metering_3~data_time$daytime,col="blue")+
  legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
