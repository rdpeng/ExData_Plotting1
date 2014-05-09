##### PLOT 3
#### this script requires the functions 'get_data' and 'make_numeric' (see Plot1.R)

# prelims: getting data, and so forth
data=get_data()
data$DateTime=paste(as.character(data$Date),as.character(data$Time))
data$DateTime=strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
x=data$DateTime

# actually plotting
quartz()
plot(x,make_numeric(data$Sub_metering_1),ylab='Energy sub metering',xlab='',yaxt='n',ylim=c(0,35),type='l',col='black')
lines(x,make_numeric(data$Sub_metering_2),col='red')
lines(x,make_numeric(data$Sub_metering_3),col='blue')
axis(side=2, at=seq(0,30,10), labels=seq(0,30,10))

# adding legend
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lwd=1)

# going to folder and saving 
setwd('/Users/jenniferli/Desktop/ExData_Plotting1/figure/')
dev.copy(png,'plot3.png')
dev.off()