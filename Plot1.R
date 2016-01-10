## Developed by JC García-Ojeda (2016)

Plot1 <- function(){
  power <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",na.strings = "?")
  power <- subset(power, dmy(Date)>= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"),select = Date:Sub_metering_3)
  #Ploting the histogram in the file device "Plot1.png" 
  png("plot1.png", width=480, height=480)
  hist(as.numeric(power$Global_active_power),col="red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
  dev.off()
}


