Enter file contents here
DATA<-read.table("household_power_consumption.txt",blank.lines.skip=TRUE,strip.white=TRUE,header=TRUE,sep=";",na.strings="?") 
Household_Power<-DATA 
str(Household_Power)
head(Household_Power) 
Household_Power$Date<-as.Date(Household_Power$Date,"%d/%m/%Y") 
Household_Power$Time<-paste(Household_Power$Date,Household_Power$Time)
Household_Power$Time<-strptime(Household_Power$Time,format="%Y-%m-%d %H:%M:%S") 
head(Household_Power) 
tail(Household_Power)
Household_Power_Final<-Household_Power[Household_Power$Date=="2007-02-01" | Household_Power$Date=="2007-02-02",] 


dev.new()
hist(Household_Power_Final$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
dev.copy(png,file="./plot1.png",width = 480, height = 480,bg="white") 
dev.off() 


