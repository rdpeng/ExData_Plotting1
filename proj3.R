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
plot(as.numeric(dt$Sub_metering_1), type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(dt$Sub_metering_2,col='Red')
lines(dt$Sub_metering_3,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save the plot data into a .png file.
dev.copy(png, file = 'plot3.png', height = 480, width = 480)
dev.off()




