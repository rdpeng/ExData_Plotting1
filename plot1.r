table1 <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

table1$Date<-as.Date(as.character(table1$Date),format="%d/%m/%Y")

table2 <- subset(table1, table1$Date == "2007-02-01" | table1$Date == "2007-02-02")

Global_active_power2 <- as.numeric(as.character(table2$Global_active_power))

table2 <- cbind(table2, Global_active_power2)

plot1 <- hist(table2$Global_active_power2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA)

plot1 <- hist(table2$Global_active_power2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
