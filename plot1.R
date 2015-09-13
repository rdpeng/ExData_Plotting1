setwd("~/rprog_data_ProgAssignment3-data/Exploratory")
library("dplyr")
powerdata<- read.table("household_power_consumption.txt",sep=";",header = TRUE)

powerdata <- transform(powerdata, Date = as.Date(Date,"%d/%m/%Y"))

powerdata <- filter(powerdata,Date>="2007-02-01" & Date <="2007-02-02")

Global_active_powers = as.numeric(as.character(powerdata$Global_active_power))

hist(Global_active_powers,main ="Global_active_power" ,
     col=2,xlab = "Global_active_power(kilowaits)" )

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
