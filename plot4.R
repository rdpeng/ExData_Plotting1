data <- household_power_consumption

# clearing name row and unrelevant variables, casting to right classes
data <- data %>% mutate (V1 = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                        V3 = as.numeric(as.character(Global_active_power)),
                        V4 = as.numeric(as.character(Global_reactive_power)),
                        V5 = as.numeric(as.character(Voltage)),
                        V7 = as.numeric(as.character(Global_intensity)),
                        V8 = as.numeric(as.character(Sub_metering_1)),
                        V9 = as.numeric(as.character(Sub_metering_2)))

# create plot
pdf(file = "plot4.pdf")
par(mfrow = c(2, 2))

with(data, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(data, plot(V1,V5, type="l", xlab = "datetime", ylab = "Voltage"))

with(data, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(data, points(V1,V7, col="black", type="l"))
with(data, points(V1,V8, col="red", type="l"))
with(data, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(data, plot(V1,V4, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()