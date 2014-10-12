
#read data
PowerConsumption<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#pc<-PowerConsumption
#PowerConsumption<-pc

#transform date as.Date() and time using strptime()
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")


#subset data for the dates relevant
Power.Subset<-subset(PowerConsumption,(PowerConsumption$Date == "2007-02-01") | (PowerConsumption$Date == "2007-02-02"))

a=paste(as.character(Power.Subset$Date),as.character(Power.Subset$Time),sep=" ")
b=as.POSIXct(a)
Power.Subset$Time=b

#transform the subset to numeric (via transformation as character)
for (i in 3:9)
{
	Power.Subset[,i]=as.character(Power.Subset[,i])
	Power.Subset[,i]=as.numeric(Power.Subset[,i])
}