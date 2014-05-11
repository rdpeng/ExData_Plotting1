table1 <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

table1$Date<-as.Date(as.character(table1$Date),format="%d/%m/%Y")

table2 <- subset(table1, table1$Date == "2007-02-01" | table1$Date == "2007-02-02")

Global_active_power2 <- as.numeric(as.character(table2$Global_active_power))

table2 <- cbind(table2, Global_active_power2)

DateTime <- paste(table2$Date, table2$Time, sep = " ")

table2 <- cbind(table2, DateTime)

png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA)

plot2 <- plot(table2$Global_active_power2 ~ table2$DateTime , type = "l", ylab = "Global Active Power (kilowatts)")

dev.off()
