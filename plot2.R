myfile <- "/Users/jamessweeney2/Desktop/Coursera/household_power_consumption.txt"
con <- read.table(myfile, sep = ";", header = TRUE)
a <- as.character(con$Date)
c <- as.Date(a, "%d/%m/%Y")
c <- con$Date
days <- con[con$Date == "1/2/2007" | con$Date == "2/2/2007",]
dt <- paste(days$Date, days$Time)
dtf <- dmy_hms(dt)
newdata <- cbind(dtf, alldays[,3:9])
png(file = "/Users/jamessweeney2/Desktop/Coursera/plot2.png")
with(newdata, plot(dtf, as.numeric(as.character(Global_active_power)), type = "l", 
                   ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
