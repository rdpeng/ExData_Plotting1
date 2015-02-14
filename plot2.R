source("./exploratoryDataProject1.R")

plot2 <-function(){
  par(mfrow=c(1,1))
  plot(data$DateTime,data$Global_active_power,type="l",main = "Global Active Power",ylab = "Global Active power (kilowatts)",xlab ="")
  dev.copy(png,"plot2.png",width=480,height=480)
  dev.off()
}

plot2()
