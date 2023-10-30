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
db$Time <- strptime(db$Time, format = "%H:%M:%S")

db$Time[1:1440] <- format(db$Time[1:1440],"2007-02-01 %H:%M:%S")
db$Time[1441:2880] <- format(db$Time[1441:2880],"2007-02-02 %H:%M:%S")

# -------------------------------------------------------------------------

plot(db$Time
     ,as.numeric(as.character(db$Global_active_power))
     ,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)") 

title(main = "Global Active Power Vs Time")

# -------------------------------------------------------------------------

dev.copy(png, here::here("exdata_consumption","plot2.png"))
dev.off()

# -------------------------------------------------------------------------
