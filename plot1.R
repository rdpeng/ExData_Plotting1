# Household power consumption

## Get relevant data from cache
hpc.dataFile <- 'hpc.RData'
if(!file.exists(hpc.dataFile)) {
  source('get_data.R')
}
load(hpc.dataFile)

## Actual plot
# Set graphic device
png(file='figure/plot1.png', width=480, height=480, type="cairo")

# Draw figure
hist(hpc$Global_active_power,
     main="Global Active Power", xlab="Global Active Power (kilowatts)",
     col= "red")

# Close current graphic device
dev.off()
