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


##Plot & save the histogram of "Global Active Power" as a png
png("plot1.png",
    width = 480,
    height = 480)

hist(Data$Global_active_power,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")

dev.off()