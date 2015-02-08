# plot1.R: Project 1, part 1 of Exploratory Data Analysis (Johns Hopkins / Coursera)
# 
# updated for February 2015 session of EDA
#
# Reads electrical power consumption data and creates a png file with a histogram
# showing Global Active Power used over two days (1-2 February 2007).
# 
# If data directory with the 'household_power_consumption' data file exists, use it.
# Otherwise, create a data directory if necessary (for the output file) and use the 
# supplied url to download the zipped file as a temporary file, unzip and read into
# a data table, and delete temp file (code for this courtesy of Dirk / Stack Overflow)

if(!file.exists(".\\data")){dir.reate(".\\data")}
hpcfile <- ".\\data\\household_power_consumption.txt"
if(file.exists(hpcfile))
  {
  print ("reading from existing text file . . . .")
  alldata <- read.table(hpcfile, sep=";", header = TRUE, stringsAsFactors = FALSE)
  } else
  {
  print ("downloading and reading from temporary zipped file")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(fileUrl,temp)
  alldata <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header = TRUE, stringsAsFactors = FALSE)
  unlink(temp)
  }

# extract data from the dates 2007-02-01 and 2007-02-02 only

data <- alldata[(alldata$Date=="1/2/2007") | (alldata$Date=="2/2/2007"),]

# create histogram showing frequency of Global Active Power usage levels as a png fil

png(filename=".\\data\\plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), 
     main = 'Global Active Power',
     xlab='Global Active Power (kilowatts)',
     border='black',
     col='red')
dev.off()
