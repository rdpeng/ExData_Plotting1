# Read file using read.csv function with delimeter as ';'. 
power_consumption<-read.csv(file="exdata-data-household_power_consumption/household_power_consumption.txt",sep=";")

# Take the subset of file as per the required date range. Note - data type conversion is done
# as by default all columns are factors. The data could have been read as per required format but I find this easier
# This data type conversion is followed while plotting the graph as well
new_power_consumption<-subset(power_consumption,as.Date(Date,"%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(Date,"%d/%m/%Y")<=as.Date("2007-02-02"))

# Setting the plot window for 1 graph
par(mfrow=c(1,1))

# Graph 2
# Specifying 480x480 pixels as per requirement
png('plot2.png',width=480,height=480)

# Creating a line graph
with(new_power_consumption,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
