## Reading the extracted data and keep the records from the dates 
## 2007-02-01 and 2007-02-02.
## Save the file to future use.
library(sqldf)
data <- read.csv.sql("Household Power Consumption.txt", 
	sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
	header = TRUE, sep = ";")

data$Datetime <- strptime(paste(data$Date, data$Time), 
                                format = "%d/%m/%Y %H:%M:%S")

saveRDS(powerData, file = "powerData.rda")
