temp <- tempfile()

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

colunas <- read.table(unz(temp, "household_power_consumption.txt"), nrows = 1, sep = ";", header = F)
colunas <- as.vector(as.matrix(colunas))

tabela <- read.table(unz(temp, "household_power_consumption.txt"), nrows = 2880, sep = ";", header = F, skip = 66637, col.names = colunas)

unlink(temp)


png(filename="plot1.png", width = 480, height = 480, units = "px")

hist(tabela$Global_active_power, col = 2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()








