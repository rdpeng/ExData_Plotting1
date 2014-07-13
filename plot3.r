#get data
        data.source <- read.table("household_power_consumption.txt", comment.char= "", sep= ";", na.strings= "?", skip= 66600, n= 3050)
        
        
#convert to data frame
        data <- data.frame(data.source)
        
#subset data for date range
        range <- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')
        
#date and time conversion 
        
        date <- as.character(range$V1)

        time <- as.character(range$V2)

        date.time <- paste(date, time)

        date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")
        
        days <- weekdays(date.time, abbreviate=TRUE)
png(filename = "plot3.png",width = 480, height = 480)


 plot (date.time,range$V7,type = "l", xlab = "", ylab = "Energy sub metering",col="black")
 lines (date.time,range$V8,type = "l", xlab = "", ylab = "Energy sub metering",col="red")
 lines (date.time,range$V9,type = "l", xlab = "", ylab = "Energy sub metering",col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
