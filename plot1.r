the_data_file <- "./data/household_power_consumption.txt"
the_data <- read.table(the_data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
the_data$Date<-as.Date(the_data$Date, "%d/%m/%Y")
the_data_subset <-subset(the_data,Date>="2007-02-01" & Date<="2007-02-02")

the_Global_active_power <- as.numeric(the_data_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(the_Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
dev.off()
