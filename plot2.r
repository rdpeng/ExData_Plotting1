##plot2 one variable by time##

##read data##
sample_data<-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";",header=TRUE, nrow=5)
classes<-sapply(sample_data,class)
mydata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c("?"), sep=";", header =TRUE,colClasses =classes)

##convert first two column types##
mydata1<-transform(mydata, Date=as.Date(Date,"%d/%m/%Y"),Time=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

##subset data##
mydata2<-subset(mydata1,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

##plot##
png("plot2.png",height=480, width=480)
with(mydata2,plot(Time,Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()