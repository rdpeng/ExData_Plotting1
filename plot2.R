# load file into R as elecP
elecP<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
# change Date variables into Date class, and subset data from the dates 2007-02-01 and 2007-02-02
library(lubridate)
elecP$Date<-dmy(elecP$Date)
elecP_sub <- subset(elecP, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02") )

# use lubridate Time, combine Date and Time to one new variable called Datetime, use mutate function from with dplyr add the in the Datetime variable into dataframe 
elecP_sub$Time<-hms(elecP_sub$Time)
Datetime<- paste(elecP_sub$Date+elecP_sub$Time)
library(dplyr)
elecP_sub<-mutate(elecP_sub,Datetime)
elecP_sub$Datetime <- as.POSIXct(elecP_sub$Datetime)

# plot2
plot(elecP_sub$Global_active_power~elecP_sub$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# copy plot2 to png device, named as "plot2.png"
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()




