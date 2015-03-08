# Household power consumption data

# Data file (too big so not put under vcs)
dataFile <- '../household_power_consumption.txt'
# Hold full data in a temporary data.table
library(data.table)
tmp <- fread(dataFile, na.strings = '?')
# Take what we need
hpc <- tmp[tmp$Date == "1/2/2007" | tmp$Date == "2/2/2007"]
rm(tmp)
save(hpc, file='hpc.RData')
