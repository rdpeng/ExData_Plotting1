if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        fileURL<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, temp, method="curl")
        file <- unzip(temp)
        unlink(temp)
}

power <- read.table(file, header=T, sep=";")

# values of all observations in a DF from read.table is by default character, need to convert them
# use as.Date( ) function to convert character data to dates
#
# The date is already in the %d/%m/%Y format in the data frame, so instruct the as.Date() accordingly
#
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#
# Extract only the observations that fall w/n these two dates
#
begdate<-"2007-02-01"
enddate<-"2007-02-02"

df <- power[(power$Date==begdate) | (power$Date==enddate),]

#
# Now need to convert the other data into usable type for processing
#
worm<-c("Global_active_power", "Global_reactive_power", "Voltage", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

for (i in worm)
{
	df[,i]<- as.numeric(as.character(df[,i]))
}


#
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
