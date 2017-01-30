the_data_file <- "./data/household_power_consumption.txt"
the_data <- read.table(the_data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

the_data$Date_asDate<-as.Date(the_data$Date, "%d/%m/%Y")
the_data_subset <-subset(the_data,Date_asDate>="2007-02-01" & Date_asDate<="2007-02-02")

datetime <- strptime(paste(the_data_subset$Date, the_data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
the_Global_active_power <- as.numeric(the_data_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, the_Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
