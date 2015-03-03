
setwd("C:/Users/user/Documents/work")
file <- "household_power_consumption.txt"
cp1_data <- read.table(file, header = FALSE, sep = ";", skip = 1, colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")
cnames <- readLines(file, 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(cp1_data) <- cnames[[1]]
cp1_data <- cp1_data[cp1_data$Date %in% c("1/2/2007", "2/2/2007"), 
                                 ]
head(cp1_data)


cp1_data$Date_Time <- paste(cp1_data$Date, cp1_data$Time)
cp1_data$Date_Time <- strptime(cp1_data$Date_Time, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(x = cp1_data$Date_Time, y = cp1_data$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
