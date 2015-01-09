#Loading the dataset into R with '?' turning into NAs
electric_power_consumption<-read.table("./Downloads/household_power_consumption.txt",sep=";",na.strings=c("?",""),header=TRUE)

#Dates that we are interested in
dates=c("1/2/2007","2/2/2007")

#Subsetting the data to include just those dates
data<-electric_power_consumption[ electric_power_consumption$Date %in% dates, ]

#Combining the Date and time to create a DateTime variable
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Generating a plot of Global active power vs DateTime as a line graph with labels
plot(data$DateTime,data$Global_active_power, type='l', 
     ylab='Global Active Power (kilowatts)', xlab="")

#Copying the plot to a file plot2.png with 480 by 480 size
dev.copy(png,file="./plot2.png", width=480, height=480)
dev.off()
