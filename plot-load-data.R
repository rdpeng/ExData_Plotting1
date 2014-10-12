# Change to your path.
setwd('/repository-ssd/work-2.0/datasciencecoursera/Exploratory\ Data\ Analysis/Course\ Project\ 1/')

# Load needed libs
library(dplyr)

#
# define some formats so we don't repeat ourselves
#
DATE_FORMAT = "%d/%m/%Y"
DATE_TIME_FORMAT = "%Y-%m-%d %H:%M:%S"
START_DATE = "01/02/2007"
END_DATE = "02/02/2007"

#
loadWattageData <- function() {

  # create a new format for coercing the Date column
  setAs("character", "customDate", function(from) {
    as.Date(from, format = DATE_FORMAT)
  })

  # presuming data file is in ./data
  tbl_df(read.table('./data/household_power_consumption.txt',
    header = TRUE,
    stringsAsFactors = FALSE,
    na.strings = '?',
    sep = ';',
    colClasses = c(
      "customDate",
      "character",
      rep("numeric", 7)
    )
  ))
}

#
# READ DATA FILE
#
# It's a big file, load it once and keep it unaltered.
# Use rm(wattageDataSource) to reread the file.
#
if (!exists("wattageDataSource")) {
  wattageDataSource <- loadWattageData()
}

#
# FILTER OUT
#
# Get the data subset that we need, from 01/02/2007 to 01/02/2007.
# Using the same custom date coercer.
#
wattageSubset <- wattageDataSource %>%
  mutate(DateTime = paste(Date, Time)) %>%
  filter(
    Date >= as.Date(START_DATE, format = DATE_FORMAT),
    Date <= as.Date(END_DATE, format = DATE_FORMAT)
  ) %>%
  select(-Date, -Time)

wattageSubset$DateTime <- strptime(wattageSubset$DateTime, DATE_TIME_FORMAT)
