# -------------------------------------------------------------------------
# Load packages -----------------------------------------------------------

library(conflicted)
library(tidyverse)

# -------------------------------------------------------------------------

db <- readr::read_delim(file = here::here("exdata_consumption","household_power_consumption.txt")
                        ,delim = ';')

db <- db %>% dplyr::filter(Date %in% c("1/2/2007","2/2/2007"))

# -------------------------------------------------------------------------

hist( as.numeric(as.character(db$Global_active_power))
      ,col = "red"
      ,main = "Global Active Power"
      ,xlab = "Global Active Power (kilowatts)")

# -------------------------------------------------------------------------

dev.copy(png, filename = here::here("exdata_consumption","plot1.png"))
dev.off()

# -------------------------------------------------------------------------