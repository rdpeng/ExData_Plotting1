
datareduction <-function (startdate, enddate){
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
mydata1 <- within(mydata, { timestamp=paste(mydata$Date, mydata$Time)})
date <- as.Date(mydata1$Date, "%d/%m/%Y")
startdate <- as.Date(startdate, "%Y-%m-%d")
enddate <- as.Date(enddate,"%Y-%m-%d")
newdata <- data.frame()
for(i in 1:length(date)) {
if (date[i] == startdate){newdata <- rbind(newdata, mydata1[i,])} else if(date[i]==enddate){newdata<- rbind(newdata, mydata1[i,])}}
head(newdata)
hist(newdata$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
}
