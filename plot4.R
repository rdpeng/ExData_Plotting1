## Exploratory Data Analysis 
## Project 1 - Plot 4
## Please make sure "household_power_consumption.txt" is in your working directory 

## Read data from the downloaded text file to memory
rawdata <- read.delim("household_power_consumption.txt", sep = ";", header=TRUE)

## Subseting the required data for 2 date from 2007-02-01 to 2007-02-02
data_subset <- rawdata[rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007" ,]

## Declare and tidy up the data with respective data type for each variable
data_tidy <- data.frame()
data_tidy <- data.frame(
                Date = as.POSIXct(paste(strptime(data_subset$Date, "%d/%m/%Y"), data_subset$Time, sep= " ")),
                Global_active_power = as.numeric(as.character(data_subset$Global_active_power)),
                Global_reactive_power = as.numeric(as.character(data_subset$Global_reactive_power)),
                Voltage = as.numeric(as.character(data_subset$Voltage)),
                Global_intensity = as.numeric(as.character(data_subset$Global_intensity)),
                Sub_metering_1 = as.numeric(as.character(data_subset$Sub_metering_1)),
                Sub_metering_2 = as.numeric(as.character(data_subset$Sub_metering_2)),
                Sub_metering_3 = as.numeric(as.character(data_subset$Sub_metering_3))
                )

## Plotting
par(mfrow=c(2,2))

plot(data_tidy$Date, data_tidy$Global_active_power, 
     type ="l", ylim=c(0,8), xlab="",
     ylab="Global Active Power (kilowatts)")

plot(data_tidy$Date, data_tidy$Voltage, xlab ="datetime", 
     type ="l", ylab="Voltage")

plot(data_tidy$Date, data_tidy$Sub_metering_1, 
     type ="l", ylim=c(0,40), ylab="Energy Sub Metering", xlab ="") 

par(new=TRUE)
plot(data_tidy$Date, data_tidy$Sub_metering_2, 
     type ="l", ylim=c(0,40), ylab="", xlab ="", 
     col = "red", axes=FALSE)

par(new=TRUE)
plot(data_tidy$Date, data_tidy$Sub_metering_3, 
     type ="l", ylim=c(0,40), ylab="", xlab ="",
     col = "blue" , axes=FALSE)

legend("topright", border="black", lty= "solid", inset = .05, box.lty=0, 
       col = c("black","red", "blue"), bty="n", cex=0.7, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data_tidy$Date, data_tidy$Global_reactive_power, 
     type ="l", ylim=c(0.0,0.5),  ylab="Global Reactive Power (kilowatts)" , xlab ="datetime" )

## Export the chart to plot1.png with a width of 480 x 480 pixels 
dev.copy(png, file ="plot4.png", width=480, height=480)
dev.off()
