data<- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_time<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_time$Date <- as.Date(data_time$Date, format="%d/%m/%Y")                  
hist(data_time$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
