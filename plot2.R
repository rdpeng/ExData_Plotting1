# reading the data
h <- read.csv2("household_power_consumption.txt", 
                na.strings="?", 
                quote="", 
                colClasses = "character",
                stringsAsFactors = FALSE)
# subsetting
h2 = h[h$Date %in% c("1/2/2007", "2/2/2007"),1:3]
h2$dt = strptime(paste(h2$Date,h2$Time), 
         format = "%d/%m/%Y %H:%M:%S") 

# setting locales to English 
# (weekdays should appear in English)
Sys.setlocale("LC_ALL","English")

# launch png device
png(filename="plot2.png")

# reproducing plot2 (time series line)
with(h2, plot(dt, as.numeric(Global_active_power),
              type="l",
              ylab="Global Active Power (kilowatts)",
              xlab=""))

# closing png device
dev.off()
