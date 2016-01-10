#load in Data
household <-read.table( "household.txt",  sep = ";", fill=TRUE)
#rename fields
names(household)[1]=paste("Date")
names(household)[2]=paste("Time")
names(household)[3]=paste("Global_active_power")
names(household)[4]=paste("Global_reactive_power")
names(household)[5]=paste("Voltage")
names(household)[6]=paste("Global_intensity")
names(household)[7]=paste("Sub_metering_1")
names(household)[8]=paste("Sub_metering_2")
names(household)[9]=paste("Sub_metering_3")

#Set the date field to a date
household[,1]<-as.Date(household[,1],"%d/%m/%Y")

#create logical vector for date range
houseSet <-household$Date>="2007-02-01"&household$Date <"2007-02-03"
#limit the results to date range
houseData<-household[houseSet,]
#Create datetime field  
h<-cbind(strptime(paste(houseData$Date,houseData$Time),"%Y-%m-%d %H:%M:%S"),houseData) 
names(h)[1]=paste("datetime")

#set up png file
png(file= "plot2.png", width=480, height =480)
#create chart
plot(h$datetime,as.numeric(as.character(h$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off() 
 
 