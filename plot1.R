library(lubridate)
library(dplyr)
path<-"C:\\Users\\rajne\\OneDrive\\Desktop\\DataScience-specialisation\\Course-4(Exploratory Data Analysis)\\Project-1\\household_power_consumption.txt"
df<-read.table(path,sep=";",header = TRUE)
df$Date<- as.Date(dmy(df$Date))
df<-subset(df,Date>="2007-02-01" & Date<="2007-02-02")
png("plot1.png",width = 480,height = 480)
hist(as.numeric(df$Global_active_power),col="red",xlab = "Global Active Power(killowatts)",ylab = "Frequancy",main = "Global Active Power")
dev.off()
