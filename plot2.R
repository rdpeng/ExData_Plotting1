setwd("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1")
dat = fread("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1/household_power_consumption.txt")
subdat = dat[which(dat$Date == '1/2/2007' |dat$Date == '2/2/2007'),]
png(filename = 'plot2.png',width = 480, height = 480)
#quartz("plot2")
dates = subdat$Date
time = subdat$Time
glb = subdat$Global_active_power
glb_num = sapply(glb,as.numeric)
x = paste(dates,time)
z = strptime(x, format = "%d/%m/%Y %H:%M:%S")
plot(z,glb_num,type = 'l',ylab = 'Global Active Power (kilowatts)')
#lines(z,glb_num)
dev.off() 
