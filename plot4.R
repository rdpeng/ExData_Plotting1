
# downloads file
if(!file.exists("data.zip")|!file.exists("household_power_consumption.txt"))
{
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
        unzip("data.zip")
}


# the following command reads only values of two dates of february month in year 2007 


# Logic is :- 
# 1) read.table("file") is nothing but a data frame
# 2) We can subset read.table("file") using "which()" function. Thereby ,filtering data for required dates.
#
# The format of the command used below is :- 
#
#
# variable <- read.table("file")[which(read.table("file")[1]=="req_date 1" OR read.table("file")[1]=="req_date 2"),]
#
# Please note that read.table("file")[1] reads only the first column. Here it is the Date column. I using this to my advantage.

data_piece <-  read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = rep(c("character"),9))[which((read.table("household_power_consumption.txt",sep = ";",header = TRUE)[1] == "1/2/2007") | (read.table("household_power_consumption.txt",sep = ";",header = TRUE)[1] == "2/2/2007")),]

# serializing the row names
rownames(data_piece) <- c(1:length(data_piece[,1]))

# Fomatting the dates 

t <- format(data_piece[,1])     # send the date vector through format function
t <-  strptime(t,"%d/%m/%Y")    # strptime(formatted_vector,"%d/%m/%Y)
data_piece[,1] <- as.Date(t)    #  pass the above result through as.Date() to remove time zone

# converting all the columns to numeric data type

col <- c(3:ncol(data_piece))
data_piece[,col] <- apply(data_piece[,col],2,function(x) as.numeric(x))

#converting Time  to "time" data type.

# Now we can construct the plot 


#Plot4 four graphs
plot.new()
windows()
device_num <- dev.cur()
par(mfcol=c(2,2))

#Plot number 1

plot(data_piece$Time,data_piece$Global_active_power,type="l",xlab = " ",ylab = "Global Active Power (kilowatts)")

#Plot number 2

plot(data_piece$Time,data_piece$Sub_metering_1,type = "n",ylab = "Energy Sub metering",xlab = " ")
points(data_piece$Time,data_piece$Sub_metering_1,type = "l")
points(data_piece$Time,data_piece$Sub_metering_2,type = "l",col="red")
points(data_piece$Time,data_piece$Sub_metering_3,type = "l",col="blue")
legend("topright",legend =  paste("Sub_metering_",1:3),col = c("black","red","blue"),lty = 1,cex = 0.5)

#Plot number 3

plot(data_piece$Time,data_piece$Voltage,type="l",ylab = "Voltage",xlab = "datetime")

#Plot number 4 

plot(data_piece$Time,data_piece$Global_reactive_power,type="l",ylab = "Global_Reactive_Power",xlab = "datetime")

if(!dir.exists("figure"))
{
        dir.create("figure")
}

dev.copy(png, file = "figure/plot4.png") 
png <- dev.cur()
dev.off(which = png) # close png file
dev.off(which = device_num) # close word file
