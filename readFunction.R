readFunction <-function(){
  # Get all Feburary 2007 Data index
  ind<-grep("/2/2007", readLines("household_power_consumption.txt"));
  
  # Get all Feburary 2007 Data
  D_tem1 <- read.table("household_power_consumption.txt", skip = ind[1],nrows=tail(ind,1),header = TRUE, sep = ";")
  
  # Get column names and assign them
  columnNames<-read.table("household_power_consumption.txt",header=FALSE,nrows=1,sep=";")
  
  colnames(D_tem1)<-unlist(columnNames);
  
  # Dates of data that we want
  dateList<-c("1/2/2007","2/2/2007");
  
  # index to desired data
  indData <- D_tem1$Date==dateList[1] | D_tem1$Date==dateList[2];
  # Obtain all desire data
  D<-D_tem1[indData,]
  
  # change Date format
  D$Date<-as.Date(D$Date,"%d/%m/%Y")
  
  return (D)
}


