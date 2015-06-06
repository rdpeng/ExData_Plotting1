plot2 <- function() {
  
  #using sql to read the data,
  #importing the sqldf library
  if (!require("sqldf")) {
    install.packages("sqldf")
  }
  
  require("sqldf")
  
  if (!require("tcltk2")) {
    install.packages("tcltk2")
  }
  
  require("tcltk2")
  
  #the file being read
  file<-"household_power_consumption.txt"
  
  #search sql
  mySql <- "select * from file where Date in ('1/2/2007','2/2/2007')"
  householdpower <-read.csv.sql(file,sql = mySql,header=T,sep=";")
  
  #format the date to the R Date Class
  householdpower$Date <- as.Date(householdpower$Date, format="%d/%m/%Y")
  
  #convert all the numbers from factors to numbers
  householdpower$Global_active_power<-as.numeric(as.character(householdpower$Global_active_power))
  householdpower$Global_reactive_power<-as.numeric(as.character(householdpower$Global_reactive_power))
  householdpower$Voltage<-as.numeric(as.character(householdpower$Voltage))
  householdpower$Global_intensity<-as.numeric(as.character(householdpower$Global_intensity))
  householdpower$Sub_metering_1<-as.numeric(as.character(householdpower$Sub_metering_1))
  householdpower$Sub_metering_2<-as.numeric(as.character(householdpower$Sub_metering_2))
  householdpower$Sub_metering_3<-as.numeric(as.character(householdpower$Sub_metering_3))
  
  #combine the date and time, and add the new timestamp onto the householdpower dataframe
  householdpower[,'timestamp'] <-
    as.POSIXct(paste(householdpower$Date, householdpower$Time), format="%Y-%m-%d %H:%M:%S")
 

  # plot Global Active Power (kilowatts) using lines.
  plot(householdpower$timestamp,householdpower$Global_active_power,
        ylab="Global Active Power (kilowatts)",xlab=" ",pch=".")
  lines(householdpower$timestamp,householdpower$Global_active_power, type="l") 
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  
}

