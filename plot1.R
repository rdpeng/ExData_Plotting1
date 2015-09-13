data <- read.table("C:/Users/Thanh/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
d1<-as.Date("01/02/2007",format="%d/%m/%Y")
d2<-as.Date("02/02/2007",format="%d/%m/%Y")
echantillon<-data[data$Date==d1|data$Date==d2,]


echantillon$Global_active_power<-as.numeric(echantillon$Global_active_power)
hist(echantillon$Global_active_power/500,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
