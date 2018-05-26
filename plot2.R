setwd <- "C:/Users/minhduc/Downloads/Documents/coursera_EDA"
#READING IN DATA
names <- read.table("household_power_consumption.txt", nrows = 1, header = F, sep = ";", stringsAsFactors = F)
mydata <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 69516-66637+1, sep = ";", 
                     dec = ".", stringsAsFactors = F, na.strings = "?")
colnames(mydata) <- names

mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S")#change class from String to Date

png("plot2.png", width = 480, height = 480, units = "px")#open png device
with(mydata, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l", lty = "solid"))#plotting
dev.off()#close the device