setwd("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1")
dat = fread("/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/Project_week1/household_power_consumption.txt")
subdat = dat[which(dat$Date == '1/2/2007' |dat$Date == '2/2/2007'),]
glb = subdat$Global_active_power
glb_num = sapply(glb,as.numeric)
png(filename = 'plot1.png',width = 480, height = 480)
hist(glb_num,col = 'red', xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
y_tick = seq(0,1200,200)
axis(2,at = y_tick, labels = y_tick)
dev.off()
