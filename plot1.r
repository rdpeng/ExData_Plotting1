require(data.table)

temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
power  <- fread(unzip(temp, "household_power_consumption.txt"), sep = ';', header = TRUE)
unlink(temp)
power <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]

Plot1data <- as.numeric(power$Global_active_power)
png("plot1.png", width=480, height=480, units="px", res=100)
par( mar = c(4,4,1,1 ))
hist(Plot1data    ,main ="Global Active Power" ,xlab ="Global Active Power (kilowatts)"
     ,ylab = 'Frequency'      ,axes = TRUE     , col = "Red"      , breaks = 13)
dev.off()