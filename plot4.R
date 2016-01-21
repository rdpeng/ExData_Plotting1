#Loading data base libaraies to load huge data and filter it 
library(RSQLite)
library(sqldf)

# Create/Connect to a database
con <- dbConnect(SQLite(), dbname = "sample_db.sqlite")

#read csv file into sql database (this is one time process to load a table so it will be commented always except first run)
#dbWriteTable(con, name="sample_table", value="household_power_consumption.txt", 
#row.names=FALSE, header=TRUE, sep = ";")

#Creating data set with required data
mydata <- dbGetQuery(con, "SELECT * FROM sample_table WHERE Date IN ('1/2/2007','2/2/2007')")

#Creating data with proper timestamp to plot on graph
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creating output on PNG Device
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#graph1
plot(datetime,mydata$Global_active_power,xlab="",ylab="Global Activity Power",type="l")

#graph2
plot(datetime,mydata$Voltage,xlab="datetime",ylab="Voltage",type="l")

#graph3
plot(datetime,mydata$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy Sub Metering")
lines(datetime,mydata$Sub_metering_2,type="l",col="red")
lines(datetime,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("SubMetering1","SubMetering2","SubMetering3"),lty=1,lwd=2.5,col=c("black","red","blue")) 

#graph4
plot(datetime,mydata$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()

#Terminating connection to DB
dbDisconnect(con)