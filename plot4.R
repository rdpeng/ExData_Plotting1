# Setting working directory
setwd("~/Desktop/Exploratory Data Analysis")

# Downloading raw data
FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl, destfile="./household_power_consumption.zip", method="curl")
textFile <- unzip("./household_power_consumption.zip", exdir = "./") # unzipping

# Reading and subsetting dataset
data_file <- c("./household_power_consumption.txt")
data <- read.table(data_file, sep = ";", header = T, na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y") # setting class as date
data <-na.omit(data) ## omitting na values
subset_data <-subset(data, (data$Date == "2007-02-01") | (data$Date == "2007-02-02")) ## subsetting by date, use date format as indicated by head(data$Date)

# Introducing Time_and_Date variable
temp<-paste(subset_data$Date, subset_data$Time)
datetime <- strptime(temp, format="%Y-%m-%d %H:%M:%S")
dataset<-data.frame(subset_data,datetime) # create new dataset merging the subsetted data frame and datetime variable

# Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataset, {
        plot(Global_active_power~datetime, type="l", ylab="Global Active Power", xlab="")
        plot(Voltage~datetime, type="l", 
             ylab="Voltage", xlab="")
        plot(Sub_metering_1~datetime, type="l", 
             ylab="Global Active Power", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~datetime, type="l", 
             ylab="Global_reactive_power",xlab="")
})

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png can be found here:", getwd())
