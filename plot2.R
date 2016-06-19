
setwd("C:/Users/alvaaa01/Desktop/Live Studies - Review/Coursera/Exploratory Data Analysis/Week1/Assignment")

graphdata <-read.table("graphdata.txt", sep="\t")

classes<- sapply(graphdata, class)
classes

##### Specify correct class for datetime variable

graphdata$datetime <- strptime(graphdata$observ, "%Y-%m-%d,%T")

############### Plot 2

png("plot2.png", width = 480, height = 480)

par(mar = c(5,4,4,3))
with(graphdata, plot(datetime, Global_active_power,type = "l", xlab = "", 
     ylab ="Global Active Power (kilowatts)") )


dev.off()






