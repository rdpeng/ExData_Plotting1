## read data
# convert the date and time into days to calculate how many lines to skip
time1 = strptime("01/02/07 00:00:00","%d/%m/%y %H:%M:%S")-strptime("16/12/06 17:24:00","%d/%m/%y %H:%M:%S")
skip_lines = as.numeric(time1)*24*3600/60
# convert the date and time into days to calculate how many lines to read
time2 = strptime("03/02/07 00:00:00","%d/%m/%y %H:%M:%S")-strptime("01/02/07 00:00:00","%d/%m/%y %H:%M:%S")
read_lines = as.numeric(time2)*24*3600/60
# read the data needed
data = read.table("./household_power_consumption.txt",nrow=read_lines, header=T,skip = skip_lines+1,  sep = ";")
names(data) = names(read.table("./household_power_consumption.txt",nrow=1, sep = ";", header = T))
# add another colum with date and time as a time object
datetime = strptime(paste(data$Date, data$Time, sep = ''), format = "%d/%m/%Y %H:%M:%S")
data$DateTime = datetime

## make plots
# plot3
par(mfrow = c(1,1))
png(file="./plot3.png")
with(data, {
  plot(DateTime, Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type='l',col="red")
  lines(DateTime, Sub_metering_3, type='l',col="blue")
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))
  })
dev.off()

