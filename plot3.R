# Household power consumption

## Get relevant data from cache
hpc.dataFile <- 'hpc.RData'
if(!file.exists(hpc.dataFile)) {
  source('get_data.R')
}
load(hpc.dataFile)

## Actual plot
# Set graphic device
png(file='figure/plot3.png', width=480, height=480, type="cairo")

# Draw figure
Sys.setlocale("LC_TIME", "C")
plot(hpc$DateTime, hpc$Sub_metering_1,
     xlab="", ylab="Energy sub metering",
     type= "l")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")

# Or use legend = grep("Sub", names(hpc), value = TRUE)
legend("topright", legend = paste0("Sub_metering_", 1:3), 
       lty=1, col=c("black", "red", "blue"))

# Close current graphic device
dev.off()
