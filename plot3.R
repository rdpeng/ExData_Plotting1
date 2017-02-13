#Get the data from UCI website

  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)   #download data 
  unzipped <- unzip(temp)                                                                                       #unzip data
  unlink(temp)                                                                                                  
  

#create dataframe from text file

powerdata <- read.table(unzipped,
                        header = T,
                        sep=";",
                        quote = "",
                        na.strings = "?",
                        colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                        strip.white = TRUE,
                        comment.char="",
                        stringsAsFactors = FALSE
)

#convert Date column characters to Date format

powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

#subset for Feb 1 to Feb 2 2007

powerdatasubset <- subset(powerdata, powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02")

#fix data and time for plotting, put in new datetime column added to dataframe 

powerdatasubset <- transform(powerdatasubset, datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#create plot3

plot(powerdatasubset$datetime,powerdatasubset$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerdatasubset$datetime,powerdatasubset$Sub_metering_2, col = "red")
lines(powerdatasubset$datetime,powerdatasubset$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#save to file plot3.png

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())

