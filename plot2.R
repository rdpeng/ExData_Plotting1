library(lubridate)
library(dplyr)
path<-"C:\\Users\\rajne\\OneDrive\\Desktop\\DataScience-specialisation\\Course-4(Exploratory Data Analysis)\\Project-1\\household_power_consumption.txt"
df<-read.table(path,sep=";",header = TRUE)
df<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")
df<-df %>% mutate(Time= as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S"))
df$Date<- as.Date(dmy(df$Date))

png("plot2.png", width =  480, height = 480)
plot(df$Time,as.numeric(df$Global_active_power),xlab = "",type="l",xaxt="n",ylab = "Global Active Power (killowatts)")
axis(1,at=df$Time,gap.axis = 10,labels = weekdays(df$Time))

dev.off()
