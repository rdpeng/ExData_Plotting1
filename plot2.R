setwd("~/rprog_data_ProgAssignment3-data/Exploratory")
library("dplyr")
powerdata<- read.table("household_power_consumption.txt",sep=";",header = TRUE)

powerda <- transform(powerdata, Date = as.Date(Date,"%d/%m/%Y"))

powerda <- filter(powerda,Date>="2007-02-01" & Date <="2007-02-02")

DateTime = as.POSIXct(paste(powerda$Date, powerda$Time),"%d/%m/%Y %H:%M:%S")
Global_active_power= as.numeric(as.character(powerda$Global_active_power))
suppressWarnings("Warning messages")
plot(DateTime,Global_active_power,main ="" ,
     xlab = "",ylab = "Global_active_power(kilowaits)",type = "l")

# copy to png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
