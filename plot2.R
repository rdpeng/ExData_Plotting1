

data <- household_power_consumption

data <- data %>% mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                        Global_active_power= as.numeric(as.character(Global_active_power))) %>% 
  select(Date, Global_active_power)

with(data, plot(Date,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# create plot
pdf(file = "plot2.pdf")

with(data, plot(Date, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
png("plot2.png", width=480, height=480)

dev.off()
