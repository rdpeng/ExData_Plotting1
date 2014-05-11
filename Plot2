hhc = read.delim("~//household_power_consumption.txt", header = T, sep = ';')

# subset dates only 2007-02-01 and 2007-02-02
hhc_sub = hhc[which(hhc$Date %in% c('1/2/2007','2/2/2007')),]

#Plot

#Convert time information
time = hhc_sub$Time
dates = hhc_sub$Date

y = paste(dates, time)

x = strptime(y, '%d/%m/%Y %H:%M:%S')
x = as.POSIXct(x)

#Plot
windows()
plot(x, hhc_sub$Global_active_power,type = "l", ylab = 'Global Active Power (kilowatts)', xlab = '')

#Save plots
png('Plot2.png', width = 480, height=480)


