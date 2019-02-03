if (!file.exists("Coursedat")) {
  dir.create("Coursedat")
}
setwd(paste(getwd(), "Coursedat", sep = "/"))
myurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myurl, paste(getwd(), "data.zip", sep = "/"))
unzip("data.zip")
power<- read.table("household_power_consumption.txt", sep= ';', header = TRUE, stringsAsFactors = FALSE)
power$Date<- strptime(power$Date, "%d/%m/%Y")
power$Date<- as.Date(as.character(power$Date))
install.packages("dplyr")
library(dplyr)
power1<- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
hist(as.numeric(power1$Global_active_power), col ="RED", main = "Global active power", xlab = "Global active power (kilowatts)")
dev.copy(png, 'plot1.png')
dev.off()

