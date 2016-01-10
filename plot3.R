# Read file using read.csv function with delimeter as ';'. 
power_consumption<-read.csv(file="exdata-data-household_power_consumption/household_power_consumption.txt",sep=";")

# Take the subset of file as per the required date range. Note - data type conversion is done
# as by default all columns are factors. The data could have been read as per required format but I find this easier
new_power_consumption<-subset(power_consumption,as.Date(Date,"%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(Date,"%d/%m/%Y")<=as.Date("2007-02-02"))

# Setting the plot window for 1 graph
par(mfrow=c(1,1))

# Graph 3
# Specifying 480x480 pixels as per requirement
png('plot3.png',width=480,height=480)
with(new_power_consumption,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_1),type="n",xlab="",ylab="Energy sub metering"))
with(new_power_consumption,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_1),type="l",col="black"))
with(new_power_consumption,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_2),type="l",col="red"))
with(new_power_consumption,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Sub_metering_3),type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),cex=0.7)
dev.off()

