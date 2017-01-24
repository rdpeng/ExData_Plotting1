#########################################################
##################project 1 #############################
#########################################################

### 1 read data ###

base <- read.table("~/COURSERA/exploratory_data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

table(base$Date)

### 2 transform variable Date to  Date type ###

base$Date <- as.Date(base$Date, "%d/%m/%Y")

table(base$Date)

### 3 Filter base ###

base <- subset(base,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

table(base$Date)

### 4 Remove missing value ###

base <- base[complete.cases(base),]

### 5 Combine Date and Time column ###

base$dateTime <- paste(base$Date, base$Time)

### 6 Format dateTime Column ###

base$dateTime <- as.POSIXct(dateTime)

########################################
############# Graph ####################
########################################

###  Create plot 1 ###

hist(base$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
# Save plot
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

### Create Plot 2 ###
plot(base$Global_active_power~base$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Save plot
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

### Create plot 3 ###

with(base, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Save plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


### Create Plot 4 ###
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(base, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
# Save plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

##########################################################################

