#Master code

if(!file.exists("Data_set.Rda"))
{
        # Read the file
        data <- read.table("household_power_consumption.txt", header = TRUE, sep=";" ) 
        data$Date_Time <-as.POSIXct(paste(data$Date,data$Time),
                                    format = "%d/%m/%Y %H:%M:%S")
        data$Date <-as.Date(data$Date, format = c("%d/%m/%Y"))
        
        
        # Using only dates between 2007-02-01 and 2007-02-02
        data <- data[data$Date >="2007-02-01" & data$Date<="2007-02-02",]
        
        data[,3] <- as.numeric(data[,3])
        data[,4] <- as.numeric(data[,4])
        data[,5] <- as.numeric(data[,5])
        data[,6] <- as.numeric(data[,6])
        data[,7] <- as.numeric(data[,7])
        data[,8] <- as.numeric(data[,8])
        data[,9] <- as.numeric(data[,9])
        
        save(data, file="Data_set.Rda")
} else {load("Data_set.Rda")}


if(!dir.exists("Pictures")){dir.create("Pictures")}

png(file="./Pictures/plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
