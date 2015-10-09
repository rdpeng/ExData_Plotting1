data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?" ,
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


data$Timestamp <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL

jcm_data <-  subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                    & as.Date(data$Timestamp) < "2007-02-03")




#datetime <- paste(as.Date(data$Date), data$Time)
#data$Datetime <- as.POSIXct(datetime)

png(filename="plot2.png", height=480, width=480, bg="transparent")


plot(jcm_data$Timestamp,jcm_data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

dev.off()
