#########################
## Project 1
## Plot4 Four Graph plots
############################

# Read the data from a file in the working directory
read_data <- function(data_file){
  print("Reading file")
  dt <- read.csv(data_file, sep = ";")

}

#subset on dates Feb.1 - Feb.2, 2007 
# also convert data graphed to numeric
subset_data <- function(dt){
  print("Subsetting data frame")
  
  # create start dates to subset data frame with
  start_date <- as.Date("01/02/2007", "%d/%m/%Y")
  end_date <- as.Date("02/02/2007", "%d/%m/%Y")
  
  # subset on Date - note format matters
  xt <- dt[as.Date(dt$Date, "%d/%m/%Y") >= start_date & as.Date(dt$Date, "%d/%m/%Y") <= end_date,]
  
  # convert variables to plot to a numeric
  Xt <- transform(xt, Global_active_power = as.numeric(as.character(Global_active_power)),
                  Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                  Voltage = as.numeric(as.character(Voltage)),
                  Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                  Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                  Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
  
}

plot1 <- function(Xt){
  print("Creating Line Graph 1")
  
  xdata <- strptime(paste(Xt$Date,Xt$Time),"%d/%m/%Y %H:%M:%S") # data for x axis
  with(Xt, plot(xdata, Xt$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab=""))
  
}

plot2 <- function(Xt){
  print("Creating Line Graph 2")
  
  xdata <- strptime(paste(Xt$Date,Xt$Time),"%d/%m/%Y %H:%M:%S") # data for x axis
  with(Xt, plot(xdata, Xt$Voltage, type="l", ylim= range(Xt$Voltage), ylab="Voltage", xlab="datetime"))
  
}

plot3 <- function(Xt){
  print("Creating Line Graph 3")
  
  xdata <- strptime(paste(Xt$Date,Xt$Time),"%d/%m/%Y %H:%M:%S") # data for x axis
  
  plot(range(xdata), range(Xt$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
  
  lines(xdata,Xt$Sub_metering_1, col = "black")
  
  lines(xdata,Xt$Sub_metering_2, col = "red")
  
  lines(xdata,Xt$Sub_metering_3, col = "blue")
  
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), 
         col = c("black","red", "blue"), cex=0.8, xjust=1)
}

plot4 <- function(Xt){
  print("Creating Line Graph 4")
  
  xdata <- strptime(paste(Xt$Date,Xt$Time),"%d/%m/%Y %H:%M:%S") # data for x axis
  with(Xt, plot(xdata, Xt$Global_reactive_power, type="l", ylim= c(0,0.5), ylab="Global_reactive_power", xlab="datetime"))
  
}

##############################
## Main function
##############################

# Read and Subset data
dt <- read_data("household_power_consumption.txt")
Xt <- subset_data(dt)

# Plotting four graphs
# set the frame - 2X2 graphs
par(mfrow = c(2, 2))

plot1(Xt)
plot2(Xt)
plot3(Xt)
plot4(Xt)


# Copy to png file
dev.copy(png,file="plot4.png")
dev.off() 


