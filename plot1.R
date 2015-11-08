libraries <- c("dplyr")
lapply(libraries,library,character.only=TRUE)

dir <- 'C:/Users/seitui/Desktop/R/Coursera/exploratory data analysis/'
setwd(dir)

lowercolnames <- function(df) {
  x <- df
  colnames(x) <- tolower(colnames(x))
  assign(deparse(substitute(df)),x,envir=.GlobalEnv)
}

power_consump <- read.table(paste0(dir,'/household_power_consumption.txt'),stringsAsFactors=FALSE,header=TRUE,sep=';',na.strings = "?" )
lowercolnames(power_consump)
#dates 2007-02-01 and 2007-02-02
power_consump$date <- strptime(power_consump$date,format='%d/%m/%Y')
date_subset <- strptime(c('2007-02-01','2007-02-02'),format='%Y-%m-%d')

power_consump_subset <- power_consump[which(power_consump$date %in% date_subset),]
power_consump_subset$date_time <- with(power_consump_subset,
                                       strptime(paste(date,time),format='%Y-%m-%d %T'))

#plot one 
png(filename=paste0(dir,'ExData_Plotting1/figure/','plot1.png'),height=480,width=480)
with(power_consump_subset,
     hist(global_active_power,col="red",
          main="Global Active Power",
          xlab="Global Active Power (Kilowatts)",
          ylab="Frequency"))
dev.off()