libraries <- c("dplyr")
lapply(libraries,library,character.only=TRUE)

dir <- 'C:/Users/seitui/Desktop/R/Coursera/exploratory data analysis'
outdir <- 'C:/Users/seitui/Documents/GitHub/ExData_Plotting1/'
setwd(dir)

lowercolnames <- function(df) {
  x <- df
  colnames(x) <- tolower(colnames(x))
  assign(deparse(substitute(df)),x,envir=.GlobalEnv)
}

power_consump <- read.table('household_power_consumption.txt',stringsAsFactors=FALSE,header=TRUE,sep=';',na.strings = "?" )
lowercolnames(power_consump)
#dates 2007-02-01 and 2007-02-02
power_consump$date <- strptime(power_consump$date,format='%d/%m/%Y')
date_subset <- strptime(c('2007-02-01','2007-02-02'),format='%Y-%m-%d')

power_consump_subset <- power_consump[which(power_consump$date %in% date_subset),]
power_consump_subset$date_time <- with(power_consump_subset,
                                       strptime(paste(date,time),format='%Y-%m-%d %T'))

#plot2
png(filename=paste(outdir,'plot2.png',sep="/"),height=480,width=480)
with(power_consump_subset,
     plot(x=date_time,
          y=global_active_power,type='l',
          xlab=" ",
          ylab="Global Active Power (kilowatts)"))

dev.off()