# Read file using read.csv function with delimeter as ';'. 
power_consumption<-read.csv(file="exdata-data-household_power_consumption/household_power_consumption.txt",sep=";")

# Take the subset of file as per the required date range. Note - data type conversion is done
# as by default all columns are factors. The data could have been read as per required format but I find this easier
new_power_consumption<-subset(power_consumption,as.Date(Date,"%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(Date,"%d/%m/%Y")<=as.Date("2007-02-02"))

# Graph 4
# Specifying 480x480 pixels as per requirement
png('plot4.png',width=480,height=480)

# Setting the plot window to be for 4 graphs 2x2 (column wise)
par(mfcol=c(2,2))

# Frist - row 1, col 1
with(new_power_consumption,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power"))

# Second - row 2, col 1
with(new_power_consumption,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_1),type="n",xlab="",ylab="Energy sub metering"))
with(new_power_consumption,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_1),type="l",col="black"))
with(new_power_consumption,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_2),type="l",col="red"))
with(new_power_consumption,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_3),type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n",cex=0.5,inset=0)

# Third - row 1, col 2
with(new_power_consumption,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Voltage),type="l",xlab="datetime",ylab="Voltage"))

# Fourth - row 2, col 2
with(new_power_consumption,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()