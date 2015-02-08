#load the file into R
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Convert date
data$Date=as.Date(data$Date,format="%d/%m/%Y")

#select data
df = data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]

#Plot
png(filename="plot1.png", width=480, height=480, units="px")
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off
