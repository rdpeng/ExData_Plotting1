
### library for SQL
library(sqldf)
#### plyr
library(plyr)

######### URL location of Zipped data file
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


### checkng if file is already downloaded and unzipped, if nottdownload and unzip
if(!file.exists("household_power_consumption.txt"))

{
	download.file(url, "household_power_consumption.zip")
	unzip("household_power_consumption.zip")
	
}

filename<-"household_power_consumption.txt"
## We will only be using data from the dates 2007-02-01 and 2007-02-02 and Global_active_power. !="?"
## One alternative is to read the data from just those dates rather than reading in 
## the entire dataset and subsetting to those dates.

sql<-'select *from file where Date in ("1/2/2007", "2/2/2007") and Global_active_power !="?"'
myTable<- read.csv.sql(filename, sql, sep = ";")


#### Creating new column datetime by meging Date and Time column not needed for this plot

NewTab<-mutate(myTable,DateTime=strptime(paste(myTable$Date, myTable$Time), "%d/%m/%Y %H:%M:%S", tz= ""))

### creating new variable mtab2, for Global_active_power with no NA values
sqldf()
mtab2<-subset(myTable, select="Global_active_power", na.rm=TRUE)

####
##png(filename = "plot1.png",   width = 480, height = 480, units = "px")

hist(as.numeric(mtab2$Global_active_power,frequency=TRUE), xlim=c(0,6), ylim=c(0,1200),xlab="Global Active Powers (killowatts)", ylab="Frequency", main="Global Active Power",col="red")

dev.copy(png,"plot1.png",width=480,height=480,units="px")


dev.off()
dev.off()

rm(myTable)