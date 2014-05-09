### function for getting the data
get_data=function(){
    #### reading in the dates, and selecting the rows corresponding to the dates of interest
    dates=read.table('household_power_consumption.txt',header=TRUE,sep=';')$Date
    formatted_dates=as.Date(as.character(dates),format="%d/%m/%Y")
    desired_rows=which((formatted_dates>'2007-01-31')&(formatted_dates<'2007-02-03'))
    
    #### clearing some space from memory
    rm(dates,formatted_dates)
    
    #### grabbing desired rows of the table
    data=read.table('household_power_consumption.txt',header=TRUE,sep=';')[desired_rows,]
    
    return(data)
}


##  PLOT 1
png(filename='plot1.png')
hist(as.numeric(as.character(data$Global_active_power)),xlab='Global Active Power (kilowatts)',col='red',main='Global Active Power')
axis(side=2, at=seq(0,1200,200), labels=seq(0,1200,200))
setwd('/Users/jenniferli/Desktop/ExData_Plotting1/figure/')
dev.off()