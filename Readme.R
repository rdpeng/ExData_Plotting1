#check and save the file in working directory using getwd()
getwd()
#load the text file in variable called power_consumptn
power_consumptn <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#the dimensions of the variable can be measured using dim() function
dim(power_consumptn)
#view the data in table format in R
View(Power_consumptn)
#summary of data can be analysed using summary() function
summary(power_consumptn)

#convert the date in dd-mm-yy format
power_consumptn$Date <- as.Date(power_consumptn$Date, "%d/%m/%Y")
#select the date greater than equal to 1-2-2007 and 2-2-2007
power_consumptn <- subset(power_consumptn,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
#select only the complete cases
power_consumptn <- power_consumptn[complete.cases(power_consumptn),]
#paste date and time in date_Time variable name
date_Time <- paste(power_consumptn$Date,power_consumptn$Time)
#change the name 
date_Time <- setNames(date_Time, "DateTime")
power_consumptn <- power_consumptn[ ,!(names(power_consumptn) %in% c("Date","Time"))]
#column bind the dateTime and power_consumptn variable
power_consumptn <- cbind(date_Time, power_consumptn)
#change the format of date
power_consumptn$date_Time <- as.POSIXct(date_Time)
