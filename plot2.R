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

# Bind the two columns (Date + Time)
DateTime <- paste(t_epc_data$Date,t_epc_data$Time, sep = " ")
t_epc_data <-cbind(t_epc_data,DateTime)

# Prepare labels for the x axis
Date_at <-list(t_epc_data$DateTime[1],t_epc_data$DateTime[1441],t_epc_data$DateTime[2880])
Date_label <- c("Thu","Fri","Sat")

# Transform Global_active_power in numeric type
t_epc_data$Global_active_power <-as.numeric(t_epc_data$Global_active_power)

# open the image device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Set a white background
par(bg = 'white')

# Create a plot on screen device (title, color, etc.)
plot(t_epc_data$DateTime,t_epc_data$Global_active_power,ylab="Global Active Power (kilowatts)",xaxt = "n")
lines(t_epc_data$DateTime,t_epc_data$Global_active_power)
axis(side = 1,at=Date_at,labels=Date_label)

# Close the PNG file
dev.off()
