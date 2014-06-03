# Before reading the data I already moved the data into a .csv file using excel

data <- read.csv("data1.csv",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#selecting data for the dates we are required to take data for

sub_data <- data[data[,1]=="1/2/2007" | data[,1]=="2/2/2007",c(1,2,3,4,5,6,7,8,9)]

#opening in png device

png(filename="plot1.png",width=480,height=480,bg="white")

hist(sub_data[,3],breaks=12,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

dev.off()


