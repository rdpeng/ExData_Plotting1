source("main.R")

# Plot 1 ----------------------
with(data, hist(Global_active_power, col="red", 
                breaks=15,
                xlab="Global Active Power (kilowatts)",
                main="Global Active Power", ylim=c(0,1200)))
# create a file plot1.png and save the output in this file
dev.copy(png, file = "plot1.png",  width = 480, height = 480)
dev.off()