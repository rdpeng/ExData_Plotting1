##Make sure to download and unzip the file (Source = https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
##set your working directory and check that "household_power_consumption.txt" is located inside
##list.files() = "household_power_consumption.txt"


##Read in the "household_power_consumption.txt"
Full_Data_Frame <- read.table("household_power_consumption.txt", 
                              header = T,
                              sep = ';',
                              na.strings = "?",
                              nrows = 2075259,
                              check.names = F,
                              stringsAsFactors = F,
                              comment.char = "",
                              quote = '\"')


##Subsett just the two days we need ("1/2/2007" & "2/2/2007")
Data <- subset(Full_Data_Frame, 
               Date %in% c("1/2/2007",
                           "2/2/2007"))


##Convert Date & Time
Data$Date <- as.Date(Data$Date,
                     format = "%d/%m/%Y")

Data$Time <- format(Data$Time,
                    format = "%H:%M:%S")


##Combine $Date & $Time
Date_Time <- paste(as.Date(Data$Date),
                   Data$Time)


##Convert "Date_Time" to POSIXct and add it to "Data" as a new column
Data$Date_Time <- as.POSIXct(Date_Time)


##Plot "Date_Time" & "Global_active_power"
png("plot3.png",
    width = 480,
    height = 480)

with(Data, 
     {  plot(Sub_metering_1~Date_Time, 
             type = "l",
             ylab = "Energy sub metering",
             xlab = "")
       
        lines(Sub_metering_2~Date_Time,
              col = 'Red')
        
        lines(Sub_metering_3~Date_Time,
              col = 'Blue') }
     )

##Add the legend
legend("topright",
       col=c("black",
             "red",
             "blue"),
       lty=1,
       lwd=2, 
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))


dev.off()