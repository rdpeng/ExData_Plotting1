# What's my available memory?
    system('systeminfo')
    #...Available Physical Memory: 345 MB

# How much memory does the file require?
    object.size(url)
    #184 bytes = 0.000184 MB
    #plenty of room

# Read in the data (assuming working directory is set)
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    #download.file(url, "household_power_consumption.txt")
        #^ this does not work because the file is zipped
        #found help here: http://stackoverflow.com/questions/3053833/using-r-to-download-zipped-data-file-extract-and-import-data
    temp <- tempfile()
    download.file(url,temp)
    mydata <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    mydata_mod <- mydata #create a second df for manipulation

#Fix the class of the Date and Time variables
    #Date
        mydata_mod$Date <- as.Date(as.character(mydata_mod$Date), format = "%d/%m/%Y")
        class(mydata_mod$Date)
        #[1] "Date"
    #Time - Attempt 1
        #mydata_mod$Time <- strptime(as.character(mydata_mod$Time), format = "%H:%M:%S")
        #^this adds an unwanted (and incorrect) date portion
        #mydata_mod$Time <- strftime(mydata_mod$Time, format = "%T")
        #^this removes the unwanted (and incorrect) date portion, but turns the class back to character
    #Time - Attempt 2
        library(chron)
        mydata_mod$Time <- times(mydata_mod$Time)
        class(mydata_mod$Time)
        #[1] "times"

# Subset the data to the only 2 dates we're interested in
    mydata_subset <- mydata_mod[mydata_mod$Date == "2007-02-01"|mydata_mod$Date == "2007-02-02",]

# Plot the data
    #First have to "merge" the Time column data into the Date column, for one date/time variable
        mydata_subset2 <- mydata_subset
        mydata_subset2$Date <- strptime(paste(as.character(mydata_subset$Date), as.character(mydata_subset$Time)), format = "%Y-%m-%d %H:%M:%S")
    #Then plot
        png("plot2.png")
        plot(mydata_subset2$Date, mydata_subset2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
    