### Reading the data 

Sys.setlocale("LC_TIME", "en_US.UTF-8")  
### Necesary to work the date and time in English

lines.to.skip <- 66637
max.num.row.to.read <- 2880

Data <- read.table(file="household_power_consumption.txt", skip = lines.to.skip , nrows = max.num.row.to.read , sep = ";", header=FALSE, na.strings = "?")
names.data <- scan(file="household_power_consumption.txt",  nlines=1 , sep = ";", what="character", quiet = TRUE)
names(Data) <- names.data

Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data$Time <- strptime(paste(Data$Date, Data$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC" )   

### Making the graph 2

png(file="plot2.png", width = 480, height = 480 )
with(Data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""  ) ) 
dev.off()
