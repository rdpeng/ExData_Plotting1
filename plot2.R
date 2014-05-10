## This script creates the first plot for the first course project for the 
## "Exploratory data analysis course" in Coursera.

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

png(filename="plot2.png",width=480,height=480,units="px")

plot(both_days_data$Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab="",xaxt="n")

axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,(dim(both_days_data)[1])/2,dim(both_days_data)[1]))

dev.off()