##The data file is downloaded manually and renamed as "power.txt"
#Extracting the data into a table using fread- which is the fastest ~about 10s in 16GB to extract the complete dataset

DT<-fread("power.txt",header = TRUE,data.table = TRUE,stringsAsFactors=FALSE,na.strings=c("?"),colClasses=c("Date","Time","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), verbose=TRUE)
##Extract rows for the two days
p<-subset(DT, DT$Date == "1/2/2007")
q<-rbind(p, subset(DT, DT$Date == "2/2/2007"))
##Changing the date and time formats
datetime<-paste(q$Date,q$Time)
DateTime<-strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
Data<-cbind(q,DateTime)

#Plot1
hist(as.numeric(q$Global_active_power),  main = "Global Active Power", xlab="Global Active Power(Killowatt)", ylab = "Frequency", col ="red")
