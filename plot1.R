mkframe<-function(csv_name){
        file_name<-csv_name
       infile<-read.csv2(file_name, header=TRUE, sep=";", colClasses = "character", na.strings=c("?","NA", "NULL", "Not Available", "Not Applicable"))
       sub_infile<- subset(infile,as.Date( as.character(infile$Date), "%d/%m/%Y")==as.Date("2007-02-01") | as.Date( as.character(infile$Date), "%d/%m/%Y")==as.Date("2007-02-02"))
       
       within(sub_infile, dtm <- strptime(paste(Date,Time ), "%m/%d/%Y %H:%M:%S"), dt<-as.Date(Date,"%m/%d/%Y"))
       
}

mkplots <- function(fname){
        dat<-mkframe("household_power_consumption.txt")
        pdf('plot1.pdf')
        hist(as.numeric(dat$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
        dev.off()
        
        
}