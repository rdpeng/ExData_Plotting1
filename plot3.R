## This script creates the first plot for the first course project for the 
## "Exploratory data analysis course" in Coursera.
## To make it work properly, run the script in the same directoy where the
## the file "household_power_consumption.txt" is located.The dataset was donwloaded from:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip



## All dates are read to check the position of the elements we are interested in

dates<-read.table(file="household_power_consumption.txt",sep=";",colClasses=c("character",rep("NULL",8)),header=T)

## The two dates we are going to use are modified to resemble the format of the dates
## present in the downloaded dataset

first_day<-gsub("01/0","1/",format(as.Date("2007-02-01"),format="%d/%m/%Y"))
second_day<-gsub("02/0","2/",format(as.Date("2007-02-02"),format="%d/%m/%Y"))

## The positions of the rows we are going to use are stored

first_ok<-which(dates[,1]==first_day)
second_ok<-which(dates[,1]==second_day)

## Only the rows we need are imported from the whole dataset

first_day_data<-read.table(file="household_power_consumption.txt",stringsAsFactors=F,sep=";",skip=(first_ok[1]),nrows=length(first_ok),header=F)

second_day_data<-read.table(file="household_power_consumption.txt",stringsAsFactors=F,sep=";",skip=(second_ok[1]),nrows=length(second_ok),header=F)

## The correct column names are assigned again and the two datasets are combined together 

var_names<-read.table(file="household_power_consumption.txt",stringsAsFactors=F,sep=";",nrows=1,header=T)
colnames(first_day_data)<-names(var_names)
colnames(second_day_data)<-names(var_names)

both_days_data<-rbind(first_day_data,second_day_data)

## the plot is created and exported

png(filename="plot3.png",width=480,height=480,units="px")

plot(both_days_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n")

lines(both_days_data$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",xaxt="n",col="red")

lines(both_days_data$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",xaxt="n",col="blue")

axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,(dim(both_days_data)[1])/2,dim(both_days_data)[1]))

legend("topright",c(names(both_days_data[7:9])),col=c("black","red","blue"),lty=1)

dev.off()
