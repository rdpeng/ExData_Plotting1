## Load library
library(lubridate)
library(dplyr)

## Read in whole file
file <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
## Convert column Date to Date type
file$Date = strptime(file$Date, format="%d/%m/%Y")
## Extract the data of interest
sub2 <- file[file$Date >="2007-02-01" & file$Date<="2007-02-02",]
## Convert column 3 to numeric
sub2$Global_active_power <- as.numeric(sub2$Global_active_power)
## Plot histogram
png(filename="plot1.png",width=480,height=480,pointsize=12,units="px")
hist(sub2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)",ylim=c(0,1200))
dev.off()

