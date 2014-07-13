#get data
        data.source <- read.table("household_power_consumption.txt", comment.char= "", sep= ";", na.strings= "?", skip= 66600, n= 3050)
        
#convert to data frame
        data <- data.frame(data.source)
        
#subset data for date range
        range <- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')

        
#convert to data frame
        data <- data.frame(data.source)
        
#subset data for date range
        range <- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')
png(filename = "plot1.png",width = 480, height = 480)

with(range,hist(range$V3,xlab="Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power" ,type="n",col="red"))

dev.off()
