
###TO RUN THE CODE SAVE THE "exdata-data-household_power_consumption.txt" file in your working directory
## You can download it from here https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

data= grep("\\b1/2/2007\\b|\\b2/2/2007\\b",readLines("household_power_consumption.txt"))#Looks for the lines with the date 1/2/2007 and 2/2/2007
first= data[1]
total= length(data)

header= read.table("household_power_consumption.txt", nrow=1, sep=";", stringsAsFactors = FALSE)# Load what is going to be the header of the data.frame
table1= read.table("household_power_consumption.txt", skip=first-1,nrow= total,sep=";") #Load the specific data with the lines from the previous search
colnames(table1)= header


date= do.call(paste, c(list(table1$Date, table$Time), list(sep=","))) #Joins the date with the time to create a new vector with both data

date= strptime(date, "%d/%m/%Y,%H:%M")# Format the date vector

table1$completeDate= date #Create a new column in the data.frame


###Plot3

png(filename = "plot3.png",
    width = 480, height = 480)

plot(table1$completeDate,table1$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(table1$completeDate,table1$Sub_metering_2, col="red")

lines(table1$completeDate,table1$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"),bg=NA)

dev.off()

