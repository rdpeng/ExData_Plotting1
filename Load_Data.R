library(dplyr)

loadData <- function() {
  read.table('househole_power_consumption.txt', sep=';', header=TRUE) %>%
    mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
    mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
    filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) %>%
    tbl_df
}
