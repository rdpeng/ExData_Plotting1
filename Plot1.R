#Exploratory data analysis assignment 1

##Import data file
HH_Pwr<-data.frame(read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors=F))
head(HH_Pwr)

## Subset data file for 1/2/2007 & 2/2/2007
HH_Pwr_Subset<-subset(HH_Pwr,with(HH_Pwr,HH_Pwr$Date=="1/2/2007"|HH_Pwr$Date=="2/2/2007"))
head(HH_Pwr_Subset)


####Creating plot1

## Check data type of Global_active_power
class(HH_Pwr_Subset$Global_active_power)

## Convert data type to numeric
HH_Pwr_Subset$Global_active_power=as.numeric(HH_Pwr_Subset$Global_active_power)

hist(HH_Pwr_Subset$Global_active_power,col="Red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
