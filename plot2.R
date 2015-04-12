plot2<-with (pow2, 
             plot(DateTime,Global_active_power, 
                  type="l", 
                  ylab = "Global Active Power (kilowatts)")
)
dev.copy(png,'plot2.png',width=480,height=480,units="px")
dev.off()
