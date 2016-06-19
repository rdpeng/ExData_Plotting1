
setwd("C:/Users/alvaaa01/Desktop/Live Studies - Review/Coursera/Exploratory Data Analysis/Week1/Assignment")

graphdata <-read.table("graphdata.txt", sep="\t")

##### Specify correct class for datetime variable

graphdata$datetime <- strptime(graphdata$observ, "%Y-%m-%d,%T")

##################### Create Plot 3

png("plot3.png", width = 480, height = 480)

par(mar=c(5,4,4,2))

with(graphdata, plot( datetime, Sub_metering_1,type = "l",xlab = "", 
     ylab ="Energy sub metering"))

with(graphdata, lines(datetime,Sub_metering_2, col = "red"))
with(graphdata, lines(datetime,Sub_metering_3, col = "blue"))
legend("topright", lty =1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

