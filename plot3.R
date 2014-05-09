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
png(filename="plot3.png",width=480,height=480,units="px",bg=NA)

## Plot Submetering_1
plot(x=inscope_data$DateTime
     ,y=inscope_data$Sub_metering_1
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Energy sub metering"
)

## Plot sub_metering_2
lines(x=inscope_data$DateTime
      ,y=inscope_data$Sub_metering_2
      ,type="l"
      ,col="red")

## Plot sub_metering_3
lines(x=inscope_data$DateTime
      ,y=inscope_data$Sub_metering_3
      ,type="l"
      ,col="blue")

legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,lwd=1
       ,col=c("black","red","blue"))


dev.off()