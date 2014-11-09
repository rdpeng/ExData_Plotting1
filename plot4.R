# First, assuming that the .txt file is in the working directorry, load the file into R.
epc_data <-read.table("./household_power_consumption.txt",h=TRUE,sep=";") 

# Get names of variables based on the first line of the file.
attach(epc_data)

# Transform the Date format
epc_data$Date <-as.Date(epc_data$Date,format='%d/%m/%Y')

# Select the rows corresponding of the date between 2007-02-01 and 2007-02-02
t_epc_data <-epc_data[which(epc_data$Date == "2007-02-01" | epc_data$Date == "2007-02-02"), ]

# Change the tz from South Korea to English
Sys.setlocale(category = "LC_TIME", locale = "C")

# Bind the two columns (Date & Time)
DateTime <- paste(t_epc_data$Date,t_epc_data$Time, sep = " ")
t_epc_data <-cbind(t_epc_data,DateTime)

# Prepare labels for the x axis
Date_at <-list(t_epc_data$DateTime[1],t_epc_data$DateTime[1441],t_epc_data$DateTime[2880])
Date_label <- c("Thu","Fri","Sat")

# Transform Global_active_power into numeric type
t_epc_data$Global_active_power <-as.numeric(t_epc_data$Global_active_power)

# Transform Global_reactive_power in numeric type
t_epc_data$Global_reactive_power <-as.numeric(t_epc_data$Global_reactive_power)

# Transform Voltage in numeric type
t_epc_data$Voltage <-as.numeric(t_epc_data$Voltage)

# Transform the 3 variables sub_metering_1, sub_metering_2 and sub_metering_3 in numeric type
t_epc_data$Sub_metering_1 <-as.numeric(t_epc_data$Sub_metering_1)
t_epc_data$Sub_metering_2 <-as.numeric(t_epc_data$Sub_metering_2)
t_epc_data$Sub_metering_3 <-as.numeric(t_epc_data$Sub_metering_3)

# open the image device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#create a matrix of 2x2 plots
par(mfrow=c(2,2), bg = 'white')

# First plot
plot(t_epc_data$DateTime,t_epc_data$Global_active_power,ylab="Global Active Power",xaxt = "n")
lines(t_epc_data$DateTime,t_epc_data$Global_active_power)
axis(side = 1,at=Date_at,labels=Date_label)

# Second plot
plot(t_epc_data$DateTime,t_epc_data$Voltage,ylab="Voltage",xlab="datetime",xaxt = "n")
lines(t_epc_data$DateTime,t_epc_data$Voltage)
axis(side = 1,at=Date_at,labels=Date_label)

# Third plot
plot(t_epc_data$DateTime,t_epc_data$Sub_metering_1,ylab="Energy sub metering",xaxt = "n",type="l")
lines(t_epc_data$DateTime,t_epc_data$Sub_metering_1)

lines(t_epc_data$DateTime,t_epc_data$Sub_metering_2,col="firebrick1")
lines(t_epc_data$DateTime,t_epc_data$Sub_metering_3,col="dodgerblue2")
axis(side = 1,at=Date_at,labels=Date_label)
legend("topright",lwd=c(1,1), bty="n" ,text.width=1450, col = c("black","firebrick1","dodgerblue2"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Fourth plot
plot(t_epc_data$DateTime,t_epc_data$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",xaxt = "n")
lines(t_epc_data$DateTime,t_epc_data$Global_reactive_power)

axis(side = 1,at=Date_at,labels=Date_label)

# Close the PNG file
dev.off()
