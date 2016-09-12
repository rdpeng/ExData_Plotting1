source("load_data.R")

plot2 <- function(data=NULL) {
    if(is.null(data))
        data <- load_data()

    png("plot2.png", width=480, height=480)
    
    plot(data$Time, data$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    dev.off()
}