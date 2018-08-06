########################################
## Step 1: Calculate Memory Req's
########################################

rows <- 2075259 #rows in dataset
columns <- 9 #columns in dataset
bytes <- rows*columns*8
mb <- bytes/(2^20)
mb
# [1] 142.4967
gb <- mb/100
gb #1.424967, doable, but large as fuck

########################################
## Step 2: Load Data & Clean & Subset
########################################
setwd("~/Desktop/Coursera/ExploratoryAnalysis/Week1/Project")

file<- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE)
names(data)
str(data)
names(data) <- tolower(names(data))


# Clean: Change ? to NAs, then change Columns 3-8 to numeric
  sum(data$voltage == "?")         # check "?" in original data
  data[data == "?"] <- NA          # replace ? with NA
  sum(is.na(data$voltage))         # check amount of NA (same as "?", good sign)
  colSums(is.na(data))             #confirm amount of NAs
  data[,3:8] <- lapply(data[,3:8], as.numeric)
  colSums(is.na(data)) #Check
  str(data)

# Change to time format of my liking
  data$date <-strptime(as.character(data$date),"%d/%m/%Y")
  str(data)
  
# Subset based on Date 2007-02-01 and 2007-02-02
  subdata <- subset(data, date == "2007-02-01" | date =="2007-02-02"); rm(data)  #rm data to clear space
  str(subdata)

########################################
## Step 3: Plot 1
########################################  
  png("plot1.png", width = 480, height = 480)
  
  with(subdata, hist(global_active_power,
                   main = "Global Active Power",
                   col = "red",
                   ylab = "Frequency",
                   xlab = "Global Active Power (kilowatts)"))
 
  dev.off()
