require(data.table)
setwd("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1")
dat = fread("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1/household_power_consumption.txt")
subdat = dat[which(dat$Date == '1/2/2007' |dat$Date == '2/2/2007'),]
png(filename = 'plot3.png',width = 480, height = 480)
#quartz("plot2")
dates = subdat$Date
time = subdat$Time
sm_1 = subdat$Sub_metering_1
sm_2 = subdat$Sub_metering_2
sm_3 = subdat$Sub_metering_3
class(sm_3)
#glb_num = sapply(glb,as.numeric)
x = paste(dates,time)
z = strptime(x, format = "%d/%m/%Y %H:%M:%S")
plot(z,sm_1,type = 'l',ylab = 'Energy Sub Metering',xlab = ' ')
lines(z,sm_2,col = 'red')
lines(z,sm_3, col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),pch = '-',lwd = 3,col = c('black','red','blue'))
#lines(z,glb_num)
dev.off() 
