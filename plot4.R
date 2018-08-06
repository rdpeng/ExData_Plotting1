########################################
## Step 1: Load Data & Clean & Subset
########################################
setwd("~/Desktop/Coursera/ExploratoryAnalysis/Week1/Project")

# Read Data & clean column names
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
## Step 2: Plot 2
########################################  
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(subdata, plot(date_time, global_active_power,
     type ="l",
     col = "black",
     xlab = "",
     ylab = "Global Active Power"))

with(subdata, plot(date_time, voltage,
                   type ="l",
                   col = "black",
                   xlab = "",
                   ylab = "Voltage"))


with(subdata, plot(x = date_time, y = sub_metering_1,
                   type = "l",
                   col = "gray",
                   xlab = "",
                   ylab = "Global Active Power (kilowatts)"
))

with(subdata, lines(date_time, sub_metering_2,
                    type = "l",
                    col = "red"))
with(subdata, lines(date_time, sub_metering_3,
                    type = "l",
                    col = "blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("gray", "red", "blue"))


with(subdata, plot(date_time, global_reactive_power,
                   type ="l",
                   col = "black",
                   xlab = "",
                   ylab = "Global_Reactive_Power"))

dev.off()
