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
png("plot2.png", width=480, height=480)
plot(datetime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#Terminating connection to DB
dbDisconnect(con)