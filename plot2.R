setwd("C:/Users/Jeffrey/Desktop/Coursera/Power Consumption")
unzip('exdata%2Fdata%2Fhousehold_power_consumption.zip')
StageIn   <- read.table('household_power_consumption.txt',header=TRUE,dec='.',sep=';',stringsAsFactors=FALSE)
Transform <- StageIn[StageIn$Date %in% c("1/2/2007","2/2/2007") ,]
df <- as.data.frame(Transform)	
df <- subset(df,Global_active_power != '?')    

pasted <- paste(df$Date , df$Time , sep = '')
datetime <- strptime(pasted, "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
with(df,plot(datetime,as.numeric(Global_active_power),type= 'l',xlab='I cant change the dutch weekdays in English weekdays...',ylab='Global Active Power(kilowatts)'))
dev.off()