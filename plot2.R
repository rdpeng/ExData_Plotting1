library(chron)

#Downloading and unzipping the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "file.zip")
unzip("file.zip")

#Take a look at the data
data_test <- read.csv("household_power_consumption.txt", header =T, sep = ";",nrows= 5)
head(data_test)

#Read the .txt file with required dates
data <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";",
                   na.strings="?", stringsAsFactors=F)
colnames(data) <- colnames(data_test)

#Coercing first 2 columns to proper classes
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- chron(times=data$Time)

#Plot and .png
png(filename = "plot2.png", width = 480, height = 480,
    units = "px", bg = "white", res = NA, restoreConsole = TRUE)

plot(data$Global_active_power, type = "l",
     ylab="Global Active Power (kilowatts)", xlab="", xaxt="n"
)
axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)),
     labels = c("Thu", "Fri", "Sat"))

dev.off()


#Done!