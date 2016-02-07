power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
library(dplyr)
## LOAD DATE INTO A DATA FROM TABLE
power <- tbl_df(power)
power2 <- mutate(power,new_date=as.Date(Date,"%d/%m/%Y"))
power3 <- filter(power2,new_date>=as.Date("2/1/2007","%m/%d/%Y"),new_date<=as.Date("2/2/2007","%m/%d/%Y"))
rm(power,power2)

## PLOT 2
plot2 <- mutate(power3, time_date=paste(new_date,Time))
plot2 <- mutate(plot2, Global_active_power=as.numeric(as.character(Global_active_power)))
plot2 <- filter(plot2, !is.na(Global_active_power))
plot2 <- mutate(plot2, time_date2=as.POSIXct(strptime(time_date, "%Y-%m-%d %H:%M:%S")))

plot(plot2$time_date2, plot2$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)", 
     cex.lab=0.75, cex.axis=0.75)
lines(plot2$time_date2, plot2$Global_active_power, type="l")
