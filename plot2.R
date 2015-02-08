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

# Plot2
plot(x=dataset$datetime, y=dataset$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot1.png can be fund here:", getwd())
