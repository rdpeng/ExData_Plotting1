myfile <- "~/Downloads/household_power_consumption.txt"
con <- read.table(myfile, sep = ";", header = TRUE)
a <- con$Date
b <- as.character(a)
c <- as.Date(b, "%d/%m/%Y")
c <- con$Date
days <- con[con$Date == "2/2/2007",]
days2 <- con[con$Date == "1/2/2007",]
alldays <- rbind(days2, days)
dt <- paste(alldays$Date, alldays$Time)
dtf <- dmy_hms(dt)
newdata <- cbind(dtf, alldays[,3:9])
png(file = "/Users/jamessweeney/Desktop/plot2.png")
with(newdata, plot(dtf, as.numeric(as.character(Global_active_power)), type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
