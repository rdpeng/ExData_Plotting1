electric<-read.delim("E:/anwesha/holiday/hopkins/exploratory data/household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?",
stringsAsFactors = FALSE)  
#electric = read.table("E:/anwesha/holiday/hopkins/exploratory data/household_power_consumption.txt",
#                  header = TRUE,
#                 sep=";",
#                dec = ".",
#                 na.strings = "?",
#                stringsAsFactors = FALSE)
#head(power, row=1)

electric <- electric[electric$Date %in% c("1/2/2007", "2/2/2007")]
str(electric)
head(electric)
names(electric)
dim(electric)
png(filename = "plot1.png", width = 480, height = 480,
    units = "px")
hist(electric$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
#create new Date_Time by pasting the Date and Time fields
electric$Date_Time <- strptime(paste(electric$Date,electric$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480,
    units = "px")
plot(electric$Date_Time,electric$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

