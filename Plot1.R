#plot1

data_set<-read.table("~/household_power_consumption.txt", header=TRUE, sep = ";",dec = ".",fill = FALSE, strip.white = TRUE)
subSetData<-data_set[data_set$Date%in%c("1/2/2007","2/2/2007"),]

data_set$Date<-as.Date(data_set$Date, format="%d/%m/%y")
data_set$Time<-strptime(data_set$Time, format="%h:%m:%s")

#now plotting the graph

Global_active<-as.numeric(paste(subSetData$Global_active_power))
png("plot1.png", width=480, height = 480)
hist(Global_active,col = "red",main = "Global Active Power", xlab="Global Active Power(KW)")
dev.off()

