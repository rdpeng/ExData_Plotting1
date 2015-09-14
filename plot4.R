require(data.table)
setwd("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1")
dat = fread("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1/household_power_consumption.txt")
subdat = dat[which(dat$Date == '1/2/2007' |dat$Date == '2/2/2007'),]
dates = subdat$Date
time = subdat$Time
x = paste(dates,time)
z = strptime(x, format = "%d/%m/%Y %H:%M:%S")
png(filename = 'plot4.png',width = 480, height = 480)
par(mfrow = c(2,2))
with(subdat,{
        plot(z,Global_active_power,type = 'l', ylab = 'Global Active Power (kilowatts)')
        plot(z,Voltage,type = 'l', ylab = 'Voltage', xlab = 'datetime')
        plot(z,Sub_metering_1,type = 'l',ylab = 'Energy Sub Metering',xlab = ' ')
        lines(z,Sub_metering_2,col = 'red')
        lines(z,Sub_metering_3, col = 'blue')
        legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),pch = '-',lwd = 3,col = c('black','red','blue'), bty = 'n')
        plot(z,Global_reactive_power,type = 'l', ylab = 'Global_Reactive_Power (kilowatts)', xlab = 'datetime')
})
dev.off()