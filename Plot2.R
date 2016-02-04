library(data.table)

## read in the houseold power consumption data
## into a data table
hp<-fread("household_power_consumption.txt",sep=";",na.strings=c("?"))

## beginning date of subset
begDate<-as.Date("01/02/2007",format="%d/%m/%Y")

##ending date of subset
endDate<-as.Date("02/02/2007",format="%d/%m/%Y")

## logical vectors for subsetting
crit1<-as.Date(hp$Date,format="%d/%m/%Y")==begDate
crit2<-as.Date(hp$Date,format="%d/%m/%Y")==endDate

## create the subset of dates we're interested in
subhp<-hp[ crit1 | crit2 ]

timeDate<-strptime(paste(subhp$Date,subhp$Time),format="%d/%m/%Y %H:%M:%S")

## create the plot
png(filename="plot2.png")
plot(timeDate,subhp$Global_active_power, type="l",
     ylab="Global Active Power (kilowats)",xlab="")
dev.off()
