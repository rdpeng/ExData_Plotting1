#read household_power_consumption.txt
consumption <- read.csv("./household_power_consumption.txt",sep = ";", header=T)
        #sub dates
        date01 <- consumption[consumption$Date == '1/2/2007',]
        date02 <- consumption[consumption$Date == '2/2/2007',]
        power2007 <- rbind(date01, date02)
        dat <-as.character(power2007$Global_active_power)
        dat <-as.numeric(dat)

#plot 1

png(file = "plot1.png")
#create plot
hist (dat,col="red", xlab="Global Active Power (killowats)", main="Global Active Power")
dev.off()
