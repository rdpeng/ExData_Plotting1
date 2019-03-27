Sys.setlocale("LC_ALL","English")

df1 <- read.table("household_power_consumption.txt", dec=".",  sep = ";", na.strings = "?", 
                stringsAsFactors = F, header = T, colClasses = c("character", 
                "character", "numeric", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric" ))

df1$DT <- strptime(paste(df1$Date, df1$Time), format = "%d/%m/%Y %H:%M:%S")
df1 <- subset(df1, DT >= "2007-02-01" & DT < "2007-02-03")

png(filename = "Figure/Plot1.png")

hist(df1$Global_active_power, col = "red", freq= T, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
