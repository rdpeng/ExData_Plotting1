par(mfrow=c(2,2))
# topleft
source('Plot1.R')
# topright
source('Plot2.R')

# bottomleft
source('Plot3.R')

# bottomright
with(data3, plot(datetime, Global_reactive_power, 
                         type="l",lwd=0.5,
                         xlab="datetime", ylab="Global_reactive_power", 
                         cex.lab=0.7, cex.axis=0.8))

# PNG
dev.copy(png,'plot4.png',  width = 640, height = 640)
dev.off()
