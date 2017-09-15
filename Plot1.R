# Finding the beginning and end of the subset we need
# The code doesn't read the file directly from the webpage
# due to the zip format. Since the focus of the assignment
# is plotting, I did not focus on it.

con<-file("household_power_consumption.txt","r")
i<-0
begin<-0
while(i < 100000){
  my_data<-strsplit(readLines(con,n=1L),";")
  if(my_data[[1]][[1]]=="1/2/2007"&begin==0){
    begin<-i
    #we found the beginning of the subset
  }else if(my_data[[1]][[1]]=="3/2/2007")
  {
    end<-i-1
    #we found the end
    break
  }
  i<-i+1
}
close(con)

#We need to reset the connection to get back to the beginning of the file
con<-file("household_power_consumption.txt","r")
#Getting the header
header<-read.table(con,header=FALSE,sep=";",na.strings ="?",nrows=1)

#getting the desired data
my_data<-read.table(con,header=FALSE,sep=";",na.strings ="?",skip=begin,nrows=end-begin)

#adding the header
colnames(my_data)<-unlist(header)
#closing the connection
close(con)

#printing the histogram
png(filename = "Plot1.png",width = 480, height = 480)
hist(my_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
