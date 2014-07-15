## Reading the extracted data and keep the records from the dates 
## 2007-02-01 and 2007-02-02.
## Save the file to future use.

fullData <- read.csv2("Household Power Consumption.txt",
                      stringsAsFactors = F, header = T, 
                      sep = ";", na.strings = "?")
powerData <- fullData[grepl("^[1-2]/2/2007", fullData$Date),]

powerData$Date_time <- strptime(paste(powerData$Date, powerData$Time), 
                                format = "%d/%m/%Y %H:%M:%S")
powerData[,c(3:9)] <- apply(powerData[,c(3:9)], 2, function(x) as.numeric(x))

saveRDS(powerData, file = "powerData.rds")
