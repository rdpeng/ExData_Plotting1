# First, assuming that the .txt file is in the working directorry, load the file into R.
epc_data <-read.table("./household_power_consumption.txt",h=TRUE,sep=";") 

# Get names of variables based on the first line of the file.
attach(epc_data)

# Transform the Date format
epc_data$Date <-as.Date(epc_data$Date,format='%d/%m/%Y')

# Select the rows corresponding of the date between 2007-02-01 and 2007-02-02
t_epc_data <-epc_data[which(epc_data$Date == "2007-02-01" | epc_data$Date == "2007-02-02"), ]

# Since Global_active_power is a factor now, let's transform it into numeric type
t_epc_data$Global_active_power <-as.numeric(t_epc_data$Global_active_power)

# open the image device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Set a white background
par(bg = 'white')

# Create a plot on screen device (title, color, etc.)
hist(t_epc_data$Global_active_power, col="firebrick1", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the PNG file
dev.off()
