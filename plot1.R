#Assumptions: 
#1. load data file "household_power_consumption.txt" into my working directory.
#2. Select only the 2 dates required 1/2/2007 & 2/2/2007 in plotting the histogram.
df_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";") 
df_datafiltered <- df_data[df_data$Date == "1/2/2007"|df_data$Date == "2/2/2007",] # subset data for 1st and 2nd Feb 2007 
png("plot1.png", width=480, height=480) 
par(mfrow = c(1,1)) #initialize environment for plot 
hist(as.numeric(as.character(df_datafiltered$Global_active_power)), xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red") 
dev.off() 
