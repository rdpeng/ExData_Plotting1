setwd <- "C:/Users/minhduc/Downloads/Documents/coursera_EDA"
#READING IN DATA
names <- read.table("household_power_consumption.txt", nrows = 1, header = F, sep = ";", stringsAsFactors = F)
mydata <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 69516-66637+1, sep = ";", 
                     dec = ".", stringsAsFactors = F, na.strings = "?")
colnames(mydata) <- names

png("plot1.png", width = 480, height = 480, units = "px")#open png device
with(mydata, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))#plotting
dev.off()#close the device
