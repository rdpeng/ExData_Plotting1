plot1 <- function() {
    library(dplyr)
    data2 <- read.table("household_power_consumption.txt",
                        sep = ";", na.strings = "?",
                        header = TRUE) %>% filter(Date == "1/2/2007" | 
                                                      Date == "2/2/2007")
    png(filename = "plot1.png", width = 480, height = 480)
    hist(data2$Global_active_power, main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)", col = "red")
    
    dev.off()
    
    
}