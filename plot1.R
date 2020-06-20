# R Code for Plot1.png

data <- read.csv("./data/household_power_consumption.txt",sep = ";",na.strings = "?", stringsAsFactors = FALSE)
nrow(data);ncol(data)
names(data)
data$Date = as.Date(data$Date,"%d/%m/%Y")
reqdata <- subset(data,Date>="2007-2-1" & Date <= "2007-2-2")
head(reqdata)
png(filename = "plot1.png",height = 480,width = 480)
hist(reqdata$Global_active_power,main="Global Active Power", col = "red",
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency")
dev.off()
