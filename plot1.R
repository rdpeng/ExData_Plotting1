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
# plot1
png(file="./plot1.png")
with(data, hist(Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.off()



