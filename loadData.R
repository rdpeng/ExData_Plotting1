loadData <- function(fileName = "household_power_consumption.txt") {
    
    df = read.table(fileName,
                    header = TRUE,
                    sep=";",
                    colClasses = c("character", "character", rep("numeric",7)),
                    na.strings = "?")
    
    ## convert time and data format
    df$Time = strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date = as.Date(df$Date, "%d/%m/%Y")
    
    # using data from the dates 2007-02-01 and 2007-02-02
    subset(df, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
}
