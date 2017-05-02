epc<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
break1<- seq(0,6,0.5)
hist1<- hist(
     as.numeric(epc$Global_active_power),
    freq = 1000,
     col="red",
     main="Global_active_power",
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency",
     pin=c(480,480)
     )
hist1
