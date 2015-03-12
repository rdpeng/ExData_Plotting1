# Household power consumption data

# Data file (too big so not put under vcs)
dataFile <- '../household_power_consumption.txt'
# # Explore column classes
# colClasses <- lapply(read.table(dataFile, sep=';', header=TRUE, na.strings=c("NA",'?'),
#                                 nrow=1), class)

# # Hold full data in a temporary data.frame
# tmp <- read.table(dataFile, sep=';', header=TRUE, na.strings='?',
#                   colClasses=c(rep("character",2), rep("numeric",7)))
# betweenDates  <- function(d, startDate, endDate, format='%Y-%m-%d') {
#   # A function to check if a string d, representing a date, lies in between
#   # two desired dates.
#   as.Date(d, format) >= as.Date(startDate, format='%Y-%m-%d') &
#     as.Date(d, format) <= as.Date(endDate, format='%Y-%m-%d')
# }
# hpc <- subset(tmp, betweenDates(Date, "2007-02-01", "2007-02-02", format='%d/%m/%Y'))

# Hold full data in a temporary data.table
library(data.table)
tmp <- fread(dataFile, sep=';', header=TRUE, na.strings=c("NA","?", ""),
             stringsAsFactors=FALSE,
             colClasses=c(rep("character",2), rep("numeric",7)))

## Take what we need
### via vector scanning (works for both data.frames and data.tables)
# hpc_slow <- tmp[tmp$Date == "1/2/2007" | tmp$Date == "2/2/2007"]

# tmp$Date <- as.Date(tmp$Date, format='%d/%m/%Y')
# hpc_slow <- tmp[Date == as.Date("1/2/2007", format='%d/%m/%Y') |
#                   Date == as.Date("2/2/2007", format='%d/%m/%Y')]

### via join/binary search (only works for data.tables)
setkey(tmp, Date)
hpc <- tmp[c("1/2/2007", "2/2/2007")]
# mapply(identical, hpc_slow, hpc) # check that both data.tables are the same

## Get rid of huge 'tmp' var.
rm(tmp)

# Save/cache the relevant data in hpc.RData
hpc[ , (3:9) := lapply(.SD, as.numeric), .SDcols = - c(1,2)] # fread is buggy
hpc$DateTime <- as.POSIXct(strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %T"))

save(hpc, file=hpc.dataFile)
