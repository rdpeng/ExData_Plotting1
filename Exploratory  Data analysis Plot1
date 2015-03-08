household <- read.csv("E:/Directory.R/explorotory data analysis/household.txt", sep=";")
subset<-household[household$Date %in% c("1/2/2007","2/2/2007"),]
subset$Date<-as.Date(subset$Date,format="%d/%m/%Y")
powerplot <- as.numeric(subset$Global_active_power)
png("plot1.png",width=480,height=480)
hist(powerplot,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
