##################################
## Data reading and cleaning
##################################
dataset <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

inscope_data <- dataset[as.character(dataset$Date) %in% c('2/2/2007','1/2/2007'),]

inscope_data$DateTime <- strptime(paste(inscope_data$Date,inscope_data$Time)
                                  ,format="%d/%m/%Y %H:%M:%S")



##################################
## Plot graph
##################################

png(filename="plot2.png",width=480,height=480,units="px",bg=NA)

plot(x=inscope_data$DateTime
     ,y=inscope_data$Global_active_power
     ,type="l"
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)"
     ,axes=TRUE
)

dev.off()
