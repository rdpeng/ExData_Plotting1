#read the data with a specific number of rows to the variable data. And subset the data that is needed.
data <- read.table("household_power_consumption.txt", nrows = 69517, header = TRUE, sep = ";", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?", fill=TRUE)
data2 <- data[66637:69516,]

#Paste date and time vector together and make a date vector "x".
y <- paste(data2[,1],data2[,2])
x <- strptime(y,format="%d/%m/%Y %H:%M:%S")

#This function makes a histogram and saves it as a png.
png("plot1.png",480,480)
hist(data2[,3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

