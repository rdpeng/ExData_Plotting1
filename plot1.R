###Install sqldf and utils packages. These lines can be skipped if you already have these packages installed! 
install.packages("sqldf")
install.packages("utils")

###Open libraries for sqldf and utils. These lines can be skipped if you have already openend these libraries!
library(sqldf)
library(utils)

###Create a new data directory within the R Script
if (!file.exists("data")) {
  dir.create("data")
}

###Download a file from the internet
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/household_power_consumption.zip", method="curl")
list.files("./data")

###Record at what date you downloaded the file
dateDownloaded <- date()
dateDownloaded

###Unzip the downloaded zip-file
unzip("./data/household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = "./data", unzip = "internal",
      setTimes = FALSE)

###Extract to a dataframe called df only those observations from the dataset that refer to 1 and 2 February 2007
df <- read.csv.sql("./data/household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

###Use paste() to paste Date and Time variable to one new variable. Use strptime() and as.Date() to convert the new character variable describing Date-Time to a date-time format
df$Datetime<-paste(df$Date, df$Time)
df$Datetime2<-as.POSIXct(strptime(df$Datetime, format="%e/%m/%Y %H:%M:%S"))

###Construct Plot1 using the BASE plotting system in R and write it to a png-file in the same folder where the dataset sits
png(file="./data/plot1.png")
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()



