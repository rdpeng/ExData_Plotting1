#Loading the dataset into R with '?' turning into NAs
electric_power_consumption<-read.table("./Downloads/household_power_consumption.txt",sep=";",na.strings=c("?",""),header=TRUE)

#Dates that we are interested in
dates=c("1/2/2007","2/2/2007")

#Subsetting the data to include just those dates
data<-electric_power_consumption[ electric_power_consumption$Date %in% dates, ]

#Generating a histogram with main label, x and y labels, no border and red bars
hist(data$Global_active_power, breaks=12, xlab='Global Active Power (kilowatts)',
          ylab='Frequency', main="Global Active Power", border=NULL, col='red',
          ylim=c(0,1200))

#Copying the plot to a file plot1.png with 480 by 480 size
dev.copy(png,file="./plot1.png", width=480, height=480)
dev.off()
