#Project01

# Read in the data
rm(list=ls())
#?readLines()
myDir <- getwd()
dataDir <- "C:/Dev/workspace/Coursera/CourseraData"
plotDir <- "C:/Dev/workspace/Coursera/ExploratoryDataAnalysis"
setwd(dataDir)
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
class(power)
power[1:3,]
dim(power)
# help.start()
# install.packages("chron")
# help(package="chron")
library(chron)

# select portion of data matching dates

stDate <- dates("02/01/2007")  #2007-02-01  [1] 02/01/07
endDate<- dates("02/02/2007")  #2007-02-02
stDate <- as.Date(stDate, "%d%b%Y")   #2007-02-01 [1] "2007-02-01"
endDate<- as.Date(endDate, "%d%b%Y")  #2007-02-02

powerStart <- subset(power,as.Date(as.character(power$Date), "%d/%m/%Y") == stDate)
powerEnd   <- subset(power,as.Date(as.character(power$Date), "%d/%m/%Y") == endDate)
powerDates <- rbind(powerStart,powerEnd)#subset(power,as.Date(as.character(power$Date), "%d/%m/%Y") == stDate, subset(power,as.Date(as.character(power$Date), "%d/%m/%Y") == endDate)))

#Check
2*1440
69518-66638
powerDates[1:2,]
#1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000
#1/2/2007;00:01:00;0.326;0.130;243.320;1.400;0.000;0.000;0.000
dim(powerDates)
powerDates[dim(powerDates)[1],]
#2/2/2007;23:59:00;3.680;0.224;240.370;15.200;0.000;2.000;18.000

#create 1st plot
setwd(plotDir)
#save the plot to a png file
png(file="plot1.png",width=480,height=480)
histPlot <- hist(powerDates$Global_active_power, main = "Global Active Power", col="red",
   xlab="Global Active Power (kilowatts)")
#show the plot on the screen
dev.off()

#return to original directory
setwd(myDir)

# all done ... rest is just junk

# 
# #Check out the data set
# pdf(file = "C:/Dev/workspace/UCSantaCruzSurveyCourse/DataExploration/myplot.pdf") ## Open PDF device; create 'myplot.pdf' in my working directory
# png(file="irisPlot.png",width=800,height=600,res=144) ## Create plot and send to a file (no plot appears on screen)
# dev.off()
# # 
# s3d <- scatterplot3d(iris[,ind], type="h", highlight.3d=TRUE,
#                      angle=55, scale.y=0.7, pch=16, main="scatterplot3d - 5")
# # Now adding some points to the "scatterplot3d"
# s3d$points3d(iris[1:50,ind],col = "blue", 
#              type="h", pch=16)
# s3d$points3d(iris[51:100,ind],col = "red", 
#              type="h", pch=16)
# s3d$points3d(iris[101:150,ind],col = "green", 
#              type="h", pch=16)
