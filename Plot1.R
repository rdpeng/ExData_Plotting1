power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
library(dplyr)
## LOAD DATE INTO A DATA FROM TABLE
power <- tbl_df(power)
power2 <- mutate(power,new_date=as.Date(Date,"%d/%m/%Y"))
power3 <- filter(power2,new_date>=as.Date("2/1/2007","%m/%d/%Y"),new_date<=as.Date("2/2/2007","%m/%d/%Y"))
rm(power,power2)

## PLOT 1
plot1 <- select(power3,Global_active_power)
plot1 <- mutate(plot1, Global_active_power=as.numeric(as.character(Global_active_power)))
plot1 <- filter(plot1, !is.na(Global_active_power))

hist(plot1$Global_active_power)
hist(plot1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", 
     cex.lab=0.75, cex.axis=0.75, cex.main=0.75)
