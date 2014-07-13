source("load_data.R")
dim(newData) # 2880   10
attach(newData)
png(filename="plot1.png", width=480, 
    height=480, units="px", bg ="transparent")
hist(Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     breaks=12, ylim=c(0, 1200))
dev.off()

