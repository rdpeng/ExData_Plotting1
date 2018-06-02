# plot4.R
# ================================================================================================================
#> sessionInfo()
# =======================================================================================================================

#  load the data from the internet, if not already loaded
if (!file.exists("household_power_consumption.txt")) {
  # check if the curl package is installed
  if (!require(curl)) { print("Please install the curl package"); stop("this programm  uses curl to download the file")}
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  tmp <- tempfile()
  curl_download(url, tmp)
  unzip(tmp)    # extract "household_power_consumption.txt" from the zip file
  unlink(tmp)   # delete the temporary file
}
# read the file
df <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  stringsAsFactors=FALSE, na.strings="?") 
str(df)

# add the date field as date class field 
df$datefield <- as.Date(df$Date, format="%d/%m/%Y")

# add  day, month and year as a numeric field  to the data frame and subset the data  
df$jjjj<- as.numeric(format(df$datefield,"%Y"))
df$mm<- as.numeric(format(df$datefield,"%m"))
df$dd<- as.numeric(format(df$datefield,"%d"))
dataset <- df[!is.na(df$Date) & df$jjjj==2007 & df$mm==2 & (df$dd==1 | df$dd==2), ]


dataset$weekdayshort <- format(dataset$datefield,"%a")
dataset$timestamp <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")
str(dataset)

table(dataset$jjjj,dataset$mm)
table(dataset$dd,dataset$weekdayshort)


plot4 <- function(device="screen") {
  if (tolower(device) == "png")     png(filename = "plot4.png", width = 480, height = 480)
  if (tolower(device) == "jpeg")    jpeg(filename ="plot4.jpeg", width = 480, height = 480)
  # if (tolower(device) == "pdf")     pdf(file = "plot4.pdf", width = 480, height = 480)
  
  par(mfrow=c(2,2))
  par(oma=c(1,1,1,1))   
  par(mar=c(4,4,1,2))   
  
  ##PLOT 1
  plot(dataset$timestamp,dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(dataset$timestamp,dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(dataset$timestamp,dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dataset$timestamp,dataset$Sub_metering_2,col="red")
  lines(dataset$timestamp,dataset$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1),bty="n", cex=.7) 
  #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly   
  
  #PLOT 4
  plot(dataset$timestamp,dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  
  
  
  if (tolower(device)!="screen")
    dev.off()
}  

plot4()
plot4("png")
# plot4("jpeg")

