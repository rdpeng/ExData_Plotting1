#Script to generate the plot1
#setwd("directory where the txt is stored")

##Load the data, only the days "1/2/2007" and "2/2/2007"
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
df1 <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]

##Convert the factors into numeric and make the plot
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))
png(file= "plot1.png")
hist(df1$Global_active_power, main="Global Active Power", xlab= "Global Active Power (kilowatts)", col="red")
dev.off()
