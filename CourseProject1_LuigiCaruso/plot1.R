
# Load File

data<-read.table('household_power_consumption.txt',sep=';',head=TRUE,na.string=c('NA','?'))

# Data Preparation

data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,format='%d/%m/%Y %H:%M:%S')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

# Row 66637=397+((15+31)*24*60) to 69516=66637+2879(=24*60*2)

dataPLOT<-data[66637:69516,]

# Graph

png('plot1.png',width=480,height=480)
hist(dataPLOT$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", freq = TRUE, col = "red")
dev.off()









 