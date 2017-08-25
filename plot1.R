# Plot 1
dat = read.csv("mydata.csv")

png("plot1.png", width = 480, height = 480)
with(dat, hist(Global_active_power, col = "red", 
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)"))
dev.off()
