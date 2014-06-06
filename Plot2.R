#Set the Working Directory:
setwd("C:\\Users\\EduRDO\\Desktop\\Coursera\\Especialização Ciencia de Dados\\4 - Exploratory Data Analysis\\Projeto 1\\exdata-data-household_power_consumption")

#Load the whole dataset in R wholeds(Whole Data Set))
wholeds<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#Convert the first column of wholeds to Date
wholeds$Date<-as.Date(wholeds$Date,format="%d/%m/%Y")

#Subset the dataset to the epcds (electric power consumption dataset) dataset
epcds<-wholeds[(wholeds$Date=="2007-02-01"|wholeds$Date=="2007-02-02"),]

#Convert the second column of the dataset to time
epcds$Time<-paste(epcds$Date,epcds$Time,sep="")
epcds$Time<-strptime(epcds$Time,format = "%Y-%m-%d %H:%M:%S")

#Plot 2:
plot(x=epcds$Time,y=epcds$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(x=epcds$Time,y=epcds$Global_active_power,lty="solid")
dev.copy(png,file="plot2.png")
dev.off()
 
