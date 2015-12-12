temp <- tempfile()

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

colunas <- read.table(unz(temp, "household_power_consumption.txt"), nrows = 1, sep = ";", header = F)
colunas <- as.vector(as.matrix(colunas))

tabela <- read.table(unz(temp, "household_power_consumption.txt"), nrows = 2880, sep = ";", header = F, skip = 66637, col.names = colunas)

unlink(temp)


png(filename="plot2.png", width = 480, height = 480, units = "px")

plot(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()




