# load data into R
data1 <- read.table ("household_power_consumption.txt", sep=";", header=T,
                     stringsAsFactors = FALSE) 
head (data1)

# convert date and time into date and time classes 
data1$Date <- as.Date(data1$Date, "%d/%m/%Y") #strptime (data1$Date, "%d/%m/%Y")
head (data1$Date) # check the head

# select dates of interest
Feb2007 <- subset (data1, Date >= "2007-02-01" & Date <= "2007-02-02")

# create appropriate data time format

x <- paste (Feb2007$Date, Feb2007$Time)
head (x)
Fin111 <- strptime (x, "%Y-%m-%d %H:%M:%S")
head(Fin111)


# Plot 3 
png("plot3.png", width = 480, height = 480)
plot (Fin111, Feb2007$Sub_metering_1, type='l', xlab="", 
      ylab="Energy sub metering", col="black")
points (Fin111, Feb2007$Sub_metering_2, type='l', col="red")
points (Fin111, Feb2007$Sub_metering_3, type='l', col="blue")
legend ("topright", 
        lwd = 2, col = c("black", "red", "blue"), 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
