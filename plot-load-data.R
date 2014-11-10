# Change to your path.
setwd('/repository-ssd/work-2.0/datasciencecoursera/Exploratory\ Data\ Analysis/Course\ Project\ 1/')

# Load needed libs
library(dplyr)

#
# Define some formats so we don't repeat ourselves
#
DATE_TIME_FORMAT = "%d/%m/%Y %H:%M:%S"
START_DATE = "1/2/2007"
END_DATE = "2/2/2007"

#
# READ DATA FILE
#
# It's a big file, load it once and keep it unaltered.
# Use rm(wattageDataSource) to reread the file.
#
if (!exists("wattageDataSource")) {

  # presuming data file is in ./data
  wattageDataSource <- tbl_df(read.table(
    './data/household_power_consumption.txt',
    header = TRUE,
    stringsAsFactors = FALSE,
    na.strings = '?',
    sep = ';',
    colClasses = c(
      rep("character", 2),
      rep("numeric", 7)
    )
  ))
}

#
# FILTER OUT
#
# Get the data subset that we need, from 01/02/2007 to 02/02/2007.
# Using the same custom date coercer.
#
wattageSubset <- wattageDataSource %>%
  filter(Date == START_DATE | Date == END_DATE) %>%
  mutate(DateTime = paste(Date, Time)) %>%
  select(-Date, -Time)

wattageSubset$DateTime <- strptime(wattageSubset$DateTime, DATE_TIME_FORMAT)
