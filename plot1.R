

setwd("C:/Users/alvaaa01/Desktop/Live Studies - Review/Coursera/Exploratory Data Analysis/Week1/Assignment")


data1<-read.table( "household_power_consumption.txt", header = TRUE, sep =";", 
                   nrows = 2075259, stringsAsFactors = FALSE )

summary(data1)
head(data1)

#### showed all variables are char except Sub_metering_3 which is numeric

#### Subset the data for required dates and change classes of variables as appropriate to Data-Time & Numeric

graphdata<- subset(data1, Date %in% c("1/2/2007", "2/2/2007"))

head(graphdata)

graphdata[,1] <- as.Date(graphdata$Date, "%d/%m/%Y")
graphdata$observ <-paste(graphdata$Date, graphdata$Time, sep = ",")
graphdata$datetime <- strptime(graphdata$observ, "%Y-%m-%d,%T")


graphdata[,3] <- as.numeric(graphdata$Global_active_power)
graphdata[,4] <- as.numeric(graphdata$Global_reactive_power)
graphdata[,5] <- as.numeric(graphdata$Voltage)
graphdata[,7] <- as.numeric(graphdata$Sub_metering_1)
graphdata[,8] <- as.numeric(graphdata$Sub_metering_2)
graphdata[,9] <- as.numeric(graphdata$Sub_metering_3)


summary(graphdata)
class(graphdata$datetime)

write.table(graphdata, "graphdata.txt", sep="\t")



########################## Create Plot 1

png("plot1.png", width = 480, height = 480)

par(mar=c(5,4,4,2))

with(graphdata, hist(Global_active_power, col="red", main = "Global Active Power", ylim = c(0,1200),
     xlab = "Global Active Power (kilowatts)"))

dev.off()


