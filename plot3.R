###Install sqldf and utils packages. These lines can be skipped if you already have these packages installed! 
install.packages("sqldf")
install.packages("utils")

###Open libraries for sqldf and utils. These lines can be skipped if you have already openend these libraries!
library(sqldf)
library(utils)

###Create a new data directory within the R Script (can be skipped if you've already run Plot1.R)
if (!file.exists("data")) {
  dir.create("data")
}

###Download a file from the internet(can be skipped if you've already run Plot1.R)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/household_power_consumption.zip", method="curl")
list.files("./data")

###Record at what date you downloaded the file (can be skipped if you've already run Plot1.R)
dateDownloaded <- date()
dateDownloaded

###Unzip the downloaded zip-file (can be skipped if you've already run Plot1.R)
unzip("./data/household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = "./data", unzip = "internal",
      setTimes = FALSE)

###Extract to a dataframe called df only those observations from the dataset that refer to 1 and 2 February 2007 (can be skipped if you've already run Plot1.R)
df <- read.csv.sql("./data/household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

###Use paste() to paste Date and Time variable to one new variable. Use strptime() and as.Date() to convert the new character variable describing Date-Time to a date-time format (can be skipped if you've already run Plot1.R)
df$Datetime<-paste(df$Date, df$Time)
df$Datetime2<-as.POSIXct(strptime(df$Datetime, format="%e/%m/%Y %H:%M:%S"))

###Open Reshape2-library in order to be able to use melt() to put the three Sub_metering variables into one new variable. This is necessary, or at least is my solution, for getting all three Sub_metering variables into one graph: Plot3
library(reshape2)
tempdf<-melt(df, id.vars=("Datetime2"), measure.vars=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), variable.name="Energy_Sub_metering")

###Construct Plot3 using the BASE plotting system in R and write it to a png-file in the same folder where the dataset sits
###Please note that weekdays are in Dutch as opposed to the English x-axis labels in the example graph
png(file="./data/plot3.png")
with(tempdf, plot(Datetime2, value, type="n", xlab="", ylab="Energy sub metering"))
with(subset(tempdf, Energy_Sub_metering == "Sub_metering_1"), lines(Datetime2, value, col = "black"))
with(subset(tempdf, Energy_Sub_metering == "Sub_metering_2"), lines(Datetime2, value, col = "red"))
with(subset(tempdf, Energy_Sub_metering == "Sub_metering_3"), lines(Datetime2, value, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()



