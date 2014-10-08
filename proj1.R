## Quang Nguyen

## Read data from the text file into a data frame
df<-read.table("c:/Coursera/DataAnalysis/household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

## Format the Date column.
as.Date(df$Date, format="%y-%m-%d")

## Create a data set for date 01/02/2007
dt1 <- sqldf("select * from df where Date = '1/2/2007'")

## Create a data set for date 02/02/2007
dt2 <- sqldf("select * from df where Date = '2/2/2007'")

## Merge two dataset into 1.
dt <- rbind(dt1, dt2)

## Plot the data.  Make sure to convert the data to numeric
hist(as.numeric(dt$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save the plot data into a .png file.
dev.copy(png, file = 'plot1.png', height = 480, width = 480)
dev.off()
