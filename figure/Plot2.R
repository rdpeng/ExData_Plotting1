#### PLOT 2
# prelims: getting data, creating a new column of Date/Time (a POSIXlt object)
data=get_data()
data$DateTime=paste(as.character(data$Date),as.character(data$Time))
data$DateTime=strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
x=data$DateTime
y=make_numeric(data$Global_active_power)

# actually plotting
quartz()
plot(x,y,ylab='Global Active Power (kilowatts)',xlab='',type='l')

# going to folder and saving 
setwd('/Users/jenniferli/Desktop/ExData_Plotting1/figure/')
dev.copy(png,'plot2.png')
dev.off()

