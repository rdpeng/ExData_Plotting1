# reading the data
h <- read.csv2("household_power_consumption.txt", 
                na.strings="?", 
                quote="", 
                colClasses = "character",
                stringsAsFactors = FALSE)
# subsetting
gap = h[h$Date %in% c("1/2/2007", "2/2/2007"),3]

# launch png device
png(filename="plot1.png")

# reproducing plot1 (histogram)
hist(as.numeric(gap), 
     col="red", 
     main = "Global Active power",
     xlab = "Global Active Power (kilowatts)")

# closing png device
dev.off()