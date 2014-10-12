#Setting the Working Directory
setwd("C:\\Abhishek\\R") 

#Reading the household_power_consumption.txt table
png_txt <- read.table("household_power_consumption.txt",sep=";",nrows=2075259,
                      col.names=c("Date","Time","Global_active_power",
                                  "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Converting the String to Numeric/Date Values as applicable
png_txt$Global_active_power <- as.numeric(as.character(png_txt$Global_active_power))
png_txt$Global_reactive_power <- as.numeric(as.character(png_txt$Global_reactive_power))
png_txt$Voltage <- as.numeric(as.character(png_txt$Voltage))
png_txt$Global_intensity <- as.numeric(as.character(png_txt$Global_intensity))
png_txt$Sub_metering_1 <- as.numeric(as.character(png_txt$Sub_metering_1))
png_txt$Sub_metering_2 <- as.numeric(as.character(png_txt$Sub_metering_2))
png_txt$Sub_metering_3 <- as.numeric(as.character(png_txt$Sub_metering_3))
png_txt$Date <- as.Date(png_txt$Date, format="%d/%m/%Y")

#Subsetting the Data within the file
png_txt <- subset(png_txt, Date == "2007-02-01" | Date == "2007-02-02")

#Using as.POSIXct to categorize data across Days
png_txt$TimeStamp <- as.POSIXct(paste(png_txt$Date, png_txt$Time))


#Plot
png("plot3.png", width = 480, height = 480)
plot(png_txt$TimeStamp,png_txt$Sub_metering_1,type="l", col = "black", ylab = "Energy sub meeting", xlab= "")
lines(png_txt$TimeStamp,png_txt$Sub_metering_2,type="l", col = "red")
lines(png_txt$TimeStamp,png_txt$Sub_metering_3,type="l", col = "blue")

legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
