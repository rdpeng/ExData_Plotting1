data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Feb1_2 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


Feb1_2$Date <- as.Date(Feb1_2$Date, format="%d/%m/%Y")
Feb1_2$Time <- strptime(Feb1_2$Time, format="%H:%M:%S")
Feb1_2[1:1440,"Time"] <- format(Feb1_2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Feb1_2[1441:2880,"Time"] <- format(Feb1_2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")



plot(Feb1_2$Time,as.numeric(as.character(Feb1_2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 


title(main="Global Active Power Vs Time")


dev.copy(png, filename="plot2.png")
dev.off()