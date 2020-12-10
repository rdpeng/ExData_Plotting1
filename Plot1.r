data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Feb1_2 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
hist(as.numeric(as.character(Feb1_2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png, filename="plot1.png")
dev.off