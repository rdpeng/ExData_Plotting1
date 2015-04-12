data_set <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
mini_data_set <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(mini_data_set$Date, mini_data_set$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(date_time, as.numeric(mini_data_set$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
