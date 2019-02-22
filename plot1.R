library(data.table)

## Get the data.
df <- fread('household_power_consumption.txt',na.strings = c('','NA','NULL'))
df <- transform(df,
                Datetime = as.POSIXct(strptime(paste(Date,Time,sep = " "),"%d/%m/%Y %H:%M:%S")),
                Global_active_power = as.numeric(Global_active_power),
                Global_reactive_power = as.numeric(Global_reactive_power),
                Voltage = as.numeric(Voltage),
                Global_intensity = as.numeric(Global_intensity),
                Sub_metering_1 = as.numeric(Sub_metering_1),
                Sub_metering_2 = as.numeric(Sub_metering_2),
                Sub_metering_3 = as.numeric(Sub_metering_3))

## Get dates of interest
df <- df[(df$Datetime >= "2007-02-01 00:00:00" 
          & df$Datetime < "2007-02-03 00:00:00"),]

## Start plotting.
png("plot1.png",width = 480,height = 480, units = "px")
par(mar = c(4,4,2,2))
hist(df$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
