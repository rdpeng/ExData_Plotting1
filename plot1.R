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

# create Plot 1 
png("plot1.png", width = 480, height = 480)
hist (as.numeric(Feb2007$Global_active_power), col="red", 
      xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

