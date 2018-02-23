#read the text file and name the columns
fd <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(fd) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")

#subset power consumption data
fd <- subset(fd,fd$date=="1/2/2007" | fd$date=="2/2/2007")

#convert the "date" and "time" columns into objects of type dates and POSIXlt
fd$date <- as.Date(fd$date, format="%d %m %Y")
fd$time <- strptime(fd$time, format="%H:%M:%S")
fd[1:1440,"time"] <- format(fd[1:1440,"time"],"2007-02-01 %H:%M:%S")
fd[1441:2880,"time"] <- format(fd[1441:2880,"time"],"2007-02-02 %H:%M:%S")

#Use Basic plot function
plot(fd$time,as.numeric(as.character(fd$global_active_power)),xlab="",ylab="Global Active Power",type="l")

#Step.3:Saving the plot in a PNG File

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()