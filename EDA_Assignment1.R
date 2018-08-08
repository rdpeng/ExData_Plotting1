setwd("C:/Users/Peter/Documents/Coursera/EDA")

mydata = read.table("household_power_consumption.txt",sep=";",
                    header = TRUE, stringsAsFactors = FALSE, na.strings = "?",
                    #colClasses = c("Date", "Date", "numeric","numeric","numeric","numeric",
                    #               "numeric","numeric","numeric")
                    )

library(dplyr)
mydata = mutate(mydata, Formatted_Dates = as.Date(Date, format="%d/%m/%Y")) #Add column with formatted dates

mydata = subset(mydata, Formatted_Dates == "2007-02-01" | Formatted_Dates == "2007-02-02")

#Plot1
par(mfrow=c(1,1))
png("plot1.png")
with(mydata, hist(Global_active_power, col="red",
                  xlab = "Global Active Power (kilowatts)", main="Global Active Power" ))
dev.off()


#Plot2
install.packages("lubridate")
library("lubridate")
ak = with(mydata, ymd(Formatted_Dates) + hms(Time))

png("plot2.png")
plot(ak, mydata$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

#Plot3

png("plot3.png")
plot(ak, mydata$Sub_metering_1,type = "l", xlab = "",
     ylab = "Energy sub metering")
points(ak, mydata$Sub_metering_2,type = "l", col="red")
points(ak, mydata$Sub_metering_3,type = "l", col="blue")

legend("topright",col=c("black", "red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

#Plot4
par(mfrow=c(2,2))

png("plot4.png")
plot(ak, mydata$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")


plot(ak, mydata$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")


plot(ak, mydata$Sub_metering_1,type = "l", xlab = "",
     ylab = "Energy sub metering")
points(ak, mydata$Sub_metering_2,type = "l", col="red")
points(ak, mydata$Sub_metering_3,type = "l", col="blue")
legend("topright",col=c("black", "red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       cex = 0.75)


plot(ak, mydata$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power"
     )
dev.off()