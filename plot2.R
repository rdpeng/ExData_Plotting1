#Course 4 Exploratory Data Analysis, Wk 1 Project, plot2
power = read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep=";",
                  dec = ".",
                  na.strings = "?",
                  stringsAsFactors = FALSE)
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
str(power)
head(power)
#create new Date_Time by pasting the Date and Time fields
power$Date_Time <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480,
    units = "px")
plot(power$Date_Time, power$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

