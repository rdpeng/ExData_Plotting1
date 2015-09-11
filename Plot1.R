power_all <- read.delim("C:\\Users\\rcorak\\Documents\\MyRStuff\\ProgrammingAssignment2\\household_power_consumption.txt",header = TRUE,sep = ";", colClasses = "character")
power_sub <- power_all[as.Date(power_all$Date,"%d/%m/%Y") == "2007/02/01" | as.Date(power_all$Date,"%d/%m/%Y") == "2007/02/02",]

hist(as.numeric(power_sub$Global_active_power), xlab ="Global Active Power (kilowatts)", col="red", main = "Global Active Power", breaks = 12)
dev.copy(png,filename="plot1.png")
dev.off ()
