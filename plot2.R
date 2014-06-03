# Before reading the data I already moved the data into a .csv file using excel

data <- read.csv("data1.csv",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#selecting data for the dates we are required to take data for
sub_data <- data[data[,1]=="1/2/2007" | data[,1]=="2/2/2007",c(1,2,3,4,5,6,7,8,9)]

dates <- paste(sub_data[,1],sub_data[,2])

#converting Date and Time from the table into POSIXct

dates<- strptime(dates,"%d/%m/%Y %T")

#opening in png device
png(filename="plot2.png",width=480,height=480,bg="white")

plot(datas,sub_data[,3],type="l",ylab="Global Active Power(kilowatts)",xlab="")

#closing png device
dev.off()
