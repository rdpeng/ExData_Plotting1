#Read in the file
hpc<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?")

#Subset the data with Date of "2007-02-01" & "2007-02-02"
hpc_sub<-subset(hpc,Date == '2/2/2007'|Date == '1/2/2007')

#Create Plot1 and Output PNG File
png("plot1.png",width=480, height=480)
hist(hpc_sub$Global_reactive_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()
