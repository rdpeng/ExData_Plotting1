# Download the data from the web and extract them into your work directory
# Important : This step is omitted if the original data is already in your working directory (Electric Power Consumption)
sourcefile <- "household_power_consumption.txt"
if (!file.exists(sourcefile) {
  if (!file.exists("ElectricPowerConsumption.zip")) {
    zipfileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(zipfileUrl, destfile = "ElectricPowerConsumption.zip")             # downlaod the zip file into the created directory
  }
  
  unzip("ElectricPowerConsumption.zip", overwrite = TRUE)                            # Unzip the zip file
}

# Read text files in order to load the data into memory
df <- read.table(sourcefile, head = TRUE, sep=";", comment.char = "", na.strings = "?")
# formatting variables
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$timetemp <- paste(df$Date, df$Time)  
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")
# subsetting data
wdf <- df[df$Date == '2007-2-1' | df$Date == '2007-2-2', c(1:9)]

# Making the plot
png(filename = "plot2.png", width = 480, height = 480)
with(wdf, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
