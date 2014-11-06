setwd("C:/Users/DE-77691/Documents/1_Work/Tasks/Coursera/Lec4/W1/")
#sample <- read.table("household_power_consumption.txt", header = TRUE,sep=";",quote="", nrow= 1000)

#data_all <- read.table("household_power_consumption.txt", header = TRUE,sep=";",quote="")
#head(data_all[data_all$Date =="1/2/2007", ]) -> starting at row 66637
#tail(data_all[data_all$Date =="2/2/2007", ]) -> ending at row 69516; (+2879)

#load data and headers
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', skip=66637, nrows=2880)
header <- read.table("household_power_consumption.txt", header=T, sep=';', nrows=1)
colnames(data) <- colnames(header)

#create png file
png(filename="plot1.png", width=480, height=480)
# plot the histogram for global active power
with(data, hist(Global_active_power, breaks=12, col='red', xlab='Global Active Power(kilowatts)', main='Global Active Power'))

dev.off()