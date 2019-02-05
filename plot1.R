a<-read.table("ExData_Plotting1\\household_power_consumption.txt",sep=";", header=T,stringsAsFactors = F)
c<-as.Date(as.character(a[[1]]),"%d/%m/%Y")
e<-a["2007-02-01"==c|"2007-02-02"==c,]
dev.copy(png,"plot1.png")
hist(as.numeric(e$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()