setwd("C:/Users/Paul/Desktop/R")
list.files()
dataFile<-"household_power_consumption.txt"
data<-read.table(dataFile,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(subData)
head(subData)

#graph 1 
globalActivePower<-as.numeric(subData$Global_active_power)
with(subData,
    globalActivePower<-as.numeric(subData$Global_active_power)
     png("plot1.png",width=480,height=480)
     hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power")
     dev.off()
     )
hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power")
