## Third plot

png(file="plot3.png") # open the PNG device
par(mfrow=c(1,1)) # just 1 frame
with(lilData,(plot(Time,Global_reactive_power,xlab = "datetime",type = "l",
                   col = "black",lwd=1)))
dev.off() # close the PNG device