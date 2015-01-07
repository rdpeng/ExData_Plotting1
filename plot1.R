##Because the data are based on time series. 
##We can find the number of rows that match the conditions.
con <- file("E:/Explory Data Analysis/assessments/1/exdata_data_household_power_consumption/household_power_consumption.txt", "r")
line=readLines(con,n=1)
n <- 0
nrows <- 0
while( length(line) != 0 ) {
  n <- n+1
  line=readLines(con,n=1)
  line <- strsplit(line, ";")
  line <- as.array(line[[1]])
  
  if (as.character(line[1])=="1/2/2007"|as.character(line[1])=="2/2/2007"){
    skip <- n
    nrows <- nrows+1
  }
  
}
close(con)

##loading the data
data <- read.table('E:/Explory Data Analysis/assessments/1/exdata_data_household_power_consumption/household_power_consumption.txt', header=T, sep=';', skip=skip-nrows+1, nrows=nrows)
header <- read.table('E:/Explory Data Analysis/assessments/1/exdata_data_household_power_consumption/household_power_consumption.txt', header=T, sep=';', nrows=1)
colnames(data) <- colnames(header)

##Making plot
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png(filename='E:/Explory Data Analysis/assessments/1/plot1.png', width=480, height=480)
with(data, hist(Global_active_power, col='red', xlab='Global Active Power(kilowatts)', main='Global Active Power'))
dev.off()


