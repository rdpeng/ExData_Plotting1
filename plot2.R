mydata <- read.csv("~/R/DataVizCourse/exdata_data_household_power_consumption/filtered_data.csv",header=TRUE)
names(mydata)[names(mydata)=="ï..Date"] <- "Date"
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")
rm(mydata)

#Plot2 in R
with(mydata, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#Plot2 in PNG
png(file="plot2.png",width=480,height=480,units="px")
with(mydata, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()