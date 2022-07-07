data<- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_time<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_time$Date <- as.Date(data_time$Date, format="%d/%m/%Y")
t_date <- paste(as.Date(data_time$Date), data_time$Time)
data_time$daytime <- as.POSIXct(t_date)
plot(data_time$Global_active_power~data_time$daytime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()