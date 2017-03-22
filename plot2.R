###############################################
#This R script creates plot file "plot2.png" 
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

#Create Line Chart
plot(df3$Global_active_power ~ df3$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")



#Save the plot file as PNG file
dev.copy(png,"plot2.png", width=480, height=480)

#close device
dev.off()
