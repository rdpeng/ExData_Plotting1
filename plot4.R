###############################################
#This R script creates plot file "plot3.png" 
###############################################


#Filter data for analysis 
###############################

#Create data frame from input data set 
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#Create new data frame by filtering (sub-setting) data for Dates "1. Feb. 2007" and "2. Feb. 2007"
df2 <- subset(df,df$Date %in% c("1/2/2007","2/2/2007"))

#Remove incomplete rows
df3 <- df2[complete.cases(df2),]


#Format Date & Time columns 
###############################

## Format column "Date" as type Date
df3$Date <- as.Date(df3$Date, "%d/%m/%Y")


#Create character vector of the concatenated values in columns "Date" and "Time"
dateTime <- paste(df3$Date, df3$Time)

#Give the name "dateTime" to created vector
dateTime <- setNames(dateTime, "DateTime")

#Remove "Date" and "Time" columns
df3 <- df3[ ,!(names(df3) %in% c("Date","Time"))]

#Add new column "dateTime"
df3 <- cbind(dateTime, df3)

#Format "dateTime" column as type Time
df3$dateTime <- as.POSIXct(dateTime)


#Plotting
###############################

#Create 4 Line Charts
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df3, {
        plot(Global_active_power ~ dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
        plot(Voltage ~ dateTime, type="l", ylab="Voltage (volt)", xlab="")
        
        plot(Sub_metering_1 ~ dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
        lines(Sub_metering_2 ~ dateTime,col='Red')
        
        lines(Sub_metering_3 ~ dateTime,col='Blue')
        
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(Global_reactive_power ~ dateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})


#Save the plot file as PNG file
dev.copy(png,"plot4.png", width=480, height=480)

#close device
dev.off()
