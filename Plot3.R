source("input_data.R")

plot3 <- function(data=NULL) {
    if(is.null(data))
        data <- load_data()

    png("plot3.png", width=400, height=400)

    plot(data$Time, data$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(data$Time, data$Sub_metering_2, col="red")
    lines(data$Time, data$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)

    dev.off()
}
