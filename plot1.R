hhpc <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";",
                   stringsAsFactors=FALSE, na.strings="?")
headings <- unlist(strsplit(readLines("household_power_consumption.txt", 1), ";"))
colnames(hhpc) <- headings
rm(headings)
hhpc$DateTime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), tz="US/Pacific",
                            format="%d/%m/%Y %H:%M:%S")
png(file="plot1.png", width=480, height=480)
hist(hhpc$Global_active_power, xlab="Global Active Power (kilowatts)", col="red",
     main="Global Active Power")
dev.off()