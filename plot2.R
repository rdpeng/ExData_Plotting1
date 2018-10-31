
if(!file.exists("data.zip")|!file.exists("household_power_consumption.txt"))
{
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
        unzip("data.zip")
}


# this command read only values of two dates of february month in year 2007 
# Logic is :- 
# 1) read.table("file") is nothing but a data frame
# 2) We can subset read.table("file") using "which()" function. Thereby ,filtering data for required dates.
#
# variable <- read.table("file")[which(read.table("file")[1]=="req_date"),]

data_piece <-  read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = rep(c("character"),9))[which((read.table("household_power_consumption.txt",sep = ";",header = TRUE)[1] == "1/2/2007") | (read.table("household_power_consumption.txt",sep = ";",header = TRUE)[1] == "2/2/2007")),]

# serializing the row names

rownames(data_piece) <- c(1:length(data_piece[,1]))

# Adding the date for the Time column

data_piece[,2] <- paste(data_piece[,1],data_piece[,2])

#converting Time  to "time" data type.

data_piece[,2] <- as.POSIXct(strptime(data_piece[,2],"%d/%m/%Y %H:%M:%S"))

# Fomatting the dates 

t <- format(data_piece[,1])     # send the date vector to format function
t <-  strptime(t,"%d/%m/%Y")    # strptime(formatted_vector,"%d/%m/%Y)
data_piece[,1] <- as.Date(t)    #  pass the above result through as.Date() to remove time zone

# converting all the 7 columns  to numeric data type

col <- c(3:ncol(data_piece))
data_piece[,col] <- apply(data_piece[,col],2,function(x) as.numeric(x))



#Plot 2 :- plot of global active power vs time 
plot.new()
plot(data_piece$Time,data_piece$Global_active_power,type="l",xlab = " ",ylab = "Global Active Power (kilowatts)")

if(!dir.exists("figure"))
{
        dir.create("figure")
}


dev.copy(png, file = "figure/plot2.png") 

dev.off() # switch off png device
