require(data.table)

temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
power  <- fread(unzip(temp, "household_power_consumption.txt"), sep = ';', header = TRUE)
unlink(temp)
power <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]

Plot1data <- as.numeric(power$Global_active_power)
Plot2data <-data.frame(y = Plot1data, x = weekdays(as.Date(power$Date,'%m/%d/%Y')))
Plot2data <-Plot2data[order(Plot2data$x,decreasing = TRUE),]
Plot2data$ID <- seq(from = 1, to =2880)
Plot2datalabels <- data.frame(y = c(0.326,0.326,0.326),x = c('Thu','Fri','Sat'), ID = c(1,1440,2880))
par( mar = c(5,5,1,1 ))
png("plot2.png", width=480, height=480, units="px", res=100)
plot(Plot2data$ID,Plot2data$y, type = 'l' , ylab ="Global Active Power (kilowatts)"  ,xlab = ''      ,axes = TRUE ,xaxt='n')
axis(1, at = Plot2datalabels$ID , labels = c('Thu','Fri','Sat')) 
dev.off()