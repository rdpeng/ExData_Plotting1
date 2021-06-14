library(data.table) # needed for fread()

#All in one step:
# Download 
# Unzip
# Grep the header and the 2 days of interest
# Convert ? into NA
data2days <- fread("curl https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip  | funzip  | egrep -w 'Date|1/2/2007|2/2/2007'",
                   na.strings="?" )

# call dev.copy() before plot() call to avoid Error in plot.new()
dev.copy( png, file="plot1.png", width=480, height=480 )

# generate histogram into the png device
hist( data2days$Global_active_power,
      main="Global Active Power", 
      xlab="Global Active Power (kilowatt)", 
      col="red" )

# close png device
dev.off()
