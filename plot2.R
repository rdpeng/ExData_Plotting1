#LOADING OF DATA AND FORMATING
#-------------------------------
  
# define column names of the data set
header <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#load the data set 
power_consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", col.names = header)  

#merge column Date and Times into an array called full_date
full_dates <- paste(power_consumption$Date,power_consumption$Time)

#converte the merged dates and time to a time object in R (easier to manipulate)
dates_rformart <- strptime(full_dates, format = "%d/%m/%Y %H:%M:%S")

#add the column of converted time object into the dataset
power_consumption$fulldate <- dates_rformart

#exctracting the subset of interest for the plot (i.e. data from 01/02/2007 to 02/02/2007)
datemin = strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")
datemax = strptime("03/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")
power_extract = subset(power_consumption, fulldate >= datemin & fulldate < datemax)

# CREATION OF PLOT 2
#---------------------
png(filename = "plot2.png") #open a png file
with(power_extract, plot(fulldate,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()


  
  
  