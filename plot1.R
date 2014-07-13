data<-read.table("household_power_consumption.txt",header=T, sep=";")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date < "2007-02-03",]



p1 <- hist(as.numeric(as.character(data$Global_active_power)),xlab ="Global active power(kilowatt)",main = "Global Active Power", col = 'Red')

dev.copy(png,'plot1.png',width = 480, height = 480,bg = "white")
dev.off()
