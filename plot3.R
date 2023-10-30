# -------------------------------------------------------------------------
# Load packages -----------------------------------------------------------

library(conflicted)
library(tidyverse)

# -------------------------------------------------------------------------

db <- readr::read_delim(file = here::here("exdata_consumption","household_power_consumption.txt")
                        ,delim = ';')

db <- db %>% dplyr::filter(Date %in% c("1/2/2007","2/2/2007"))

# -------------------------------------------------------------------------

db$Date <- as.Date(db$Date, format = "%d/%m/%Y")
db$Time <- strptime(b$Time, format = "%H:%M:%S")

db$Time[1:1440] <- format(db$Time[1:1440],"2007-02-01 %H:%M:%S")
db$Time[1441:2880] <- format(db$Time[1441:2880],"2007-02-02 %H:%M:%S")

# -------------------------------------------------------------------------

plot(db$Time,db$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

# -------------------------------------------------------------------------

with(db,lines(Time, as.numeric(as.character(Sub_metering_1))))

with(db,lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))

with(db,lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))

# -------------------------------------------------------------------------

legend( "topright"
        ,lty = 1
        ,col = c("black","red","blue")
        ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main = "Energy sub-metering")

# -------------------------------------------------------------------------

dev.copy(png, filename = here::here("exdata_consumption","plot3.png"))
dev.off()

# -------------------------------------------------------------------------
