epc<-read.table(
                file = "household_power_consumption.txt", 
                header = TRUE, 
                sep = ";",
                colClasses = "character" 
                )

epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Date <- as.Date(strptime(epc$Date,"%e/%m/%Y"))

epc_plot1 <- epc[which(epc$Date=="2007-02-01" |epc$Date=="2007-02-02"),]

png(file = "F:/datascience/rworkspace/sophia/ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")

hist(epc_plot1$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 20)

dev.off()

