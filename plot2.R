source("main.R")

# Plot 2 ----------------------

with(data, plot(Time, Global_active_power, 
                type="l",
                xlab="",
                ylab="Global Active Power (in kilowatts)"))

# create a file plot2.png and save the output in this file
dev.copy(png, file = "plot2.png",  width = 480, height = 480)
dev.off()