#Loading information and generating data set filtered by date 
datoenergy <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', 
                         colClasses = c("character", "character", rep("numeric",7)), 
                         na = "?")

datoenergy$Date <- as.Date(datoenergy$Date, "%d/%m/%Y")
subdatenerg <- subset(datoenergy, Date == "2007-02-01" | Date == "2007-02-02")


#GRAPHIC 1
png(filename = "plot1.png", width = 480, height = 480)

##Use the hist() function
hist(subdatenerg$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

## close device
dev.off()




