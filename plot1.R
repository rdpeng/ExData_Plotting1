source("./exploratoryDataProject1.R")
plot1 <-function(){
  par(mfrow=c(1,1))
  hist(data$Global_active_power,col = "red",main = "Global Active Power", 
       xlab = "Global Active power (kilowatts)",ylab = "frequency",xlim=c(0,6),ylim=c(0,1200)) 
  dev.copy(png,'plot1.png',width=480,height=480)
  dev.off()
}

plot1()
