
#Read in the file
hpc<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?")

#Subset the data with Date of "2007-02-01" & "2007-02-02"
hpc_sub<-subset(hpc,Date == '2/2/2007'|Date == '1/2/2007')

#Concatenate Date and Time
hpc_sub$Datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time, sep=" "), format=（"%d/%m/%Y %H:%M:%S"))

#Create Plot2 and Output PNG File
png("plot2.png", width=480, height=480)
plot(hpc_sub$Datetime,hpc_sub$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
