#Assumptions: 
#1. Load data file "household_power_consumption.txt" in working directory before execution 
#2. To compute the weekly power consumption (kilowatts) per Global Active Power.  
df_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";") 
df_datafiltered <- df_data[df_data$Date == "1/2/2007"|df_data$Date == "2/2/2007",] # subset data for 1st and 2nd Feb 2007 
# create dt, a new datetime column for time series plotting. 
df_datafiltered$dt <- strptime(paste(as.character(df_datafiltered$Date), as.character(df_datafiltered$Time), sep=", "), format="%d/%m/%Y, %H:%M:%S") 
png("plot3.png", width=480, height=480) 
par(mfrow = c(1,1)) #initialize environment for plot 
with(df_datafiltered,{ 
  plot(dt,as.numeric(as.character(Sub_metering_1)),type="l" , ylab = "Energy sub metering", xlab="") 
  lines(dt,as.numeric(as.character(Sub_metering_2)), col="red" ) 
  lines(dt,as.numeric(as.character(Sub_metering_3)), col="blue" ) 
  legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
}) 
dev.off()
