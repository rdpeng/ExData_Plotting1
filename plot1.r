##plot1--histgram##

##read data##
sample_data<-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";",header=TRUE, nrow=5)
classes<-sapply(sample_data,class)
mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c("?"), sep=";", header =TRUE,colClasses =classes)

##convert first two column types##
mydata1<-transform(mydata, Date=as.Date(Date,"%d/%m/%Y"),Time=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

##subset data##
mydata2<-subset(mydata1,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

##plot##

png("plot1.png",height=480, width=480)

hist(mydata2$Global_active_power, col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')

dev.off()