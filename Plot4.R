#Ploting the Graph 3
data<- read.table('C:/Users/kiss/Desktop/cousera/data/cdata.txt', sep=';', 
                  header=T,na='?') #reading the textfile


data2<- within(electric,{Date<- as.Date(Date,'%d/%m/%Y')
}) # Setting the Date format to date

data3<- within(data2,{Datetime<- paste(Date,Time)
                      strptime(Datetime,'%Y-%m-%d %H:%M:%S')
}) #convert the Date and Time variables to Date/Time 
#classe

data4<- subset(data3, Date <= as.Date("2007-02-02") & 
                 Date >= as.Date("2007-02-01")) # subsetting 2007-02-01 and 
#2007-02-02 dataset from the the whole database
dim(data4) # checking the subset dataset

#Setting the resolution of the PNG Output
png(filename = "Plot4.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

#Split the screen in 2x2
par(mfrow=c(2,2))


#Ploting the Graph 1

plot( as.POSIXct(data4$Datetime),data4$Global_active_power, type='l',
      xlab='',ylab='Global Active Power (kilowatts)')

#Ploting the Graph 2

plot( as.POSIXct(data4$Datetime),data4$Voltage, type='l',
      xlab='datetime',ylab='Voltage')

#Ploting the Graph 3
with(data4,plot( as.POSIXct(data4$Datetime),data4$Sub_metering_1, 
                 type='l',col='black',ylab='Energy sub metering', xlab='')
)
with(data4,lines( as.POSIXct(data4$Datetime),data4$Sub_metering_2,
                  col='red')
)
with(data4,lines( as.POSIXct(data4$Datetime),data4$Sub_metering_3,
                  col='blue')
)

legend("topright", legend = c('Sub metering 1','Sub metering 2',
                              'Sub metering 3'), col=c('black','red','blue'), 
       lty=c(1,1), lwd=c(2.4,2.4,2.4)
)


#Ploting the Graph 4

plot( as.POSIXct(data4$Datetime),data4$Global_reactive_power, type='l',
      xlab='datetime',ylab='Global_reactive_power')

dev.off() #finish the image