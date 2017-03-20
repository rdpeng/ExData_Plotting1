############################################################################################
## Exploratory Data Analysis
## CourseProject1.R RScript File
############################################################################################

getwd()
setwd("/Users//Desktop/Coursera/Data Science - R/4. Exploratory Data Analysis/Week 1")

dat<-read.table("household_power_consumption.txt",header = T,sep = ";")
dat$date_create<- as.Date(dat$Date,"%d/%m/%Y")
dat$datetime_create <-strptime(paste(dat$Date[],dat$Time[],sep = " "),format ="%d/%m/%Y %H:%M:%S" )
dat$Global_active_power_create <- as.numeric(as.character(dat$Global_active_power))
dat$subset <- (dat$date_create == "2007-02-01" | dat$date_create == "2007-02-02")

dat_sub<- dat[dat$subset == TRUE,]
dat_sub$sub1<- as.numeric(as.character(dat_sub$Sub_metering_1))
dat_sub$sub2<- as.numeric(as.character(dat_sub$Sub_metering_2))
dat_sub$sub3<- as.numeric(as.character(dat_sub$Sub_metering_3))
dat_sub$reactive <- as.numeric(as.character(dat_sub$Global_reactive_power))
dat_sub$volt <- as.numeric(as.character(dat_sub$Voltage))

#########
#Plot 1
#########
par(mfrow=c(1,1),mar = c(4.5,4.5,2,2))
png("plot1.png", width = 480, height = 480)
hist(subset(dat,subset == TRUE)$Global_active_power_create, col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

#########
#Plot 2
#########
png("plot2.png", width = 480, height = 480)
plot(x = dat_sub$datetime_create, y = dat_sub$Global_active_power_create, 
    ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
  lines(x = dat_sub$datetime_create, y = dat_sub$Global_active_power_create)
dev.off()
  
#########
#Plot 3
#########
  png("plot3.png", width = 480, height = 480)
  plot(x = dat_sub$datetime_create, y = dat_sub$sub1, 
    ylab = "Energy sub metering",type = "n", xlab = "")
  lines(x = dat_sub$datetime_create, y = dat_sub$sub1)
  lines(x = dat_sub$datetime_create, y = dat_sub$sub2, col = "red")
  lines(x = dat_sub$datetime_create, y = dat_sub$sub3, col = "blue")
  legend("topright", 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    lty = c(1,1,1),
    col = c("black","red","blue"))
  dev.off()
  
#########
#Plot 4
#########
  png("plot4.png", width = 480, height = 480) 
  par(mfrow=c(2,2),mar = c(4.5,4.5,0.5,0.5))
   
#Global Active Power
  plot(x = dat_sub$datetime_create, y = dat_sub$Global_active_power_create, 
       ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
  lines(x = dat_sub$datetime_create, y = dat_sub$Global_active_power_create)

#Voltage 
  plot(x = dat_sub$datetime_create, y = dat_sub$volt, 
       ylab = "Voltage", xlab = "datetime", type = "n")
  lines(x = dat_sub$datetime_create, y = dat_sub$volt)
  
#Enerty sub metering
  plot(x = dat_sub$datetime_create, y = dat_sub$sub1, 
       ylab = "Energy sub metering",type = "n", xlab = "")
  lines(x = dat_sub$datetime_create, y = dat_sub$sub1)
  lines(x = dat_sub$datetime_create, y = dat_sub$sub2, col = "red")
  lines(x = dat_sub$datetime_create, y = dat_sub$sub3, col = "blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1),
         col = c("black","red","blue"))
  
#Global Reactive Power
  plot(x = dat_sub$datetime_create, y = dat_sub$reactive, 
       ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
  lines(x = dat_sub$datetime_create, y = dat_sub$reactive)
  dev.off()
