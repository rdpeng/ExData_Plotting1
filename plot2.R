# Household power consumption

## Get relevant data from cache
hpc.dataFile <- 'hpc.RData'
if(!file.exists(hpc.dataFile)) {
  source('get_data.R')
}
load(hpc.dataFile)

## Actual plot
# Set graphic device
png(file='figure/plot2.png', width=480, height=480, type="cairo")

# Draw figure
Sys.setlocale("LC_TIME", "C")
plot(hpc$DateTime, hpc$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)",
     type= "l")

# Close current graphic device
dev.off()
