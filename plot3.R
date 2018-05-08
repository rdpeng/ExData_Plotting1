

data <- household_power_consumption



# clearing name row and unrelevant variables, casting to right classes
data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                        V7 = as.numeric(as.character(Sub_metering_1)),
                        V8 = as.numeric(as.character(Sub_metering_2)),
                        V9 = as.numeric(as.character(Sub_metering_3))) 


data <- data %>% select(V1,V7:V9) %>% filter (V1 == "2007-02-01" |  V1 == "2007-02-02")

# create plot
pdf(file = "plot3.pdf")

with(data, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(data, points(V1,V7, col="black", type="l"))
with(data, points(V1,V8, col="red", type="l"))
with(data, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

dev.off()