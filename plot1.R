library(lubridate)
### Read in full data set
con <- file("~./R/household_power_consumption.txt","r") 
full_data <- read.table(con, sep = ";" , header = T , na.strings ="", stringsAsFactors= F) 
close(con)

##select 2 days data
full_data$Date <- as.Date(full_data$Date,"%d/%m/%Y")
data1 <- subset(full_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## remove unwanted data to free up memory
rm(full_data)
## handle NA value and plot
data1$Global_active_power[data1$Global_active_power=="?"] <- NA 
data1$Global_active_power <- as.numeric(data1$Global_active_power) 
hist(data1$Global_active_power , col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)") 
png(file="plot1.png",width = 480, height = 480)
hist(data1$Global_active_power , col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)") 
dev.off()
