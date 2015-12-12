plot<-function(){
  mydata = read.table("household_power_consumption.txt",na.strings = "?",sep=";",header=TRUE)
  mydata$Date<-as.Date(mydata$Date, format = "%d/%m/%Y")
  data<-subset(mydata,mydata$Date==as.Date(factor("2007-02-01"))|mydata$Date==as.Date(factor("2007-02-02")))
}
