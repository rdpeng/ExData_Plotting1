##reading the file
hpc<-read.csv2("household_power_consumption.txt",colClasses = "character")

##converting Date column as a date variable and subsetting the required dates
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hp<-hpc[hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02",]

##converting Time column as POSIXlt variable by adding the corresponding date
hp$Time<-paste(hp$Date,hp$Time)
hp$Time<-strptime(hp$Time,"%Y-%m-%d %H:%M:%S")

##converting rest of the columns into numeric variables
hp[,3:9]<-sapply(hp[,3:9],as.numeric)

##plotting
hist(hp$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")

##sending to file device
dev.copy(png,"plot1.png")
dev.off()