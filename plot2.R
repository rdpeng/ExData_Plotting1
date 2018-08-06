########################################
## Step 1: Load Data & Clean & Subset
########################################
setwd("~/Desktop/Coursera/ExploratoryAnalysis/Week1/Project")

# Read Data
  file<- "./household_power_consumption.txt"
  data <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE)
  names(data) <- tolower(names(data))

#  Subset Data (Different from Plot1, I will need time to be a continuous variable related to date)
  subdata <- subset(data, date == "1/2/2007" | date =="2/2/2007"); rm(data)  #rm data to clear space

# change all non date/time rows to numeric      
  subdata[,3:8] <- lapply(subdata[,3:8], as.numeric)
  
# Need the continuous time and date together for this graph
 subdata$date_time <- strptime(paste(subdata$date, subdata$time, sep = ""), "%d/%m/%Y %H:%M:%S") 


########################################
## Step 3: Plot 2
########################################  
png("plot2.png", width = 480, height = 480)

with(subdata, plot(date_time, global_active_power,
                   type = "l",
                   col = "red",
                   xlab = "",
                   ylab = "Global Active Power (kilowatts)"))

dev.off()

