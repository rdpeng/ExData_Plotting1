############################################################

# Course   : Data Science Specialization: 
# EDA      : project 1
# file name: plot1.R
# plot name: plot1.PNG 
# Name     : Nagaraju Aswadhati

## remove all the existing environment variables
rm(list = ls())
## load the data
data <- read.table("household_power_consumption.txt", 
                   header = T, 
                   sep = ";", 
                   na.strings = "?")
# dim(data)
# summary(data)
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset the data
data <- 
  subset(data, 
         subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert Date and Time
data$datetime <- 
  strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# histogram for Global_active_power
attach(data)
hist(Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "Red")

# Save plot1.PNG
dev.copy(png, 
         file = "plot1.png", 
         height = 480, 
         width = 480)
dev.off()
detach(data)

############################################################