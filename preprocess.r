
if(!file.exists("exdata-data-household_inputTable_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_inputTable_consumption.zip",temp)
        inputfile <- unzip(temp)
        unlink(temp)
}

inputTable <- read.table(file, header=T, sep=";")

#
# Not going to plot all day range, just the selected one...  There are too many to plot otherwise
# 

inputTable$Date <- as.Date(inputTable$Date, format="%d/%m/%Y")

begdate<-"2007-02-01"
enddate<-"2007-02-02"

df <- inputTable[(inputTable$Date==begdate) | (inputTable$Date==enddate),]

#
# Well, gotta convert the data into numeric values since read.table by default treats data as R objects, need to convert them to scalar
# Is there a better way to do this?
#
df$Global_active_power <- as.numeric(as.character(df$Global_active_inputTable))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_inputTable))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#
# Plots 2 - 4 ask for day of the week, need to convert date+time into time w/n day of week
# 
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

