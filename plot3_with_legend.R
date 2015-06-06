plot3 <- function() {
  
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
  
  #plot the sub metering values
  with(householdpower, plot(householdpower$timestamp, householdpower$Sub_metering_1, type = "n", 
                            ylab="Energy Sub Metering",xlab=" "))
  with(householdpower, lines(householdpower$timestamp, householdpower$Sub_metering_1, col = "black"))
  with(householdpower, lines(householdpower$timestamp, householdpower$Sub_metering_2, col = "red"))
  with(householdpower, lines(householdpower$timestamp, householdpower$Sub_metering_3, col = "blue"))

  #add the legend
  legend( "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
          cex=.6,lty=c(1,1), col=c("black","red","blue"))
  
  
  dev.copy(png, file="plot3.png", width=500, height=500)
  dev.off()
  
}
