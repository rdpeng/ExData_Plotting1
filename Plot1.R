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


#Plot 1 - Histogram
hist(epcds$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()

