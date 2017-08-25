library(dplyr)

# download data from the website
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, method = "curl", destfile = "project1_data.zip")

# unzip file and load only first 10 rows
path = unzip("project1_data.zip")
init_dat = read.table(path, header = T, sep = ";", na.strings = "?", nrows = 10)

# explore column classes
colclass = apply(init_dat, 1, class)
colclass = c(rep("character", 2), rep("numeric", 7))
colnames = colnames(init_dat)

# load dates and find what rows to subset between 2007-02-1 and 2007-02-02
dates = read.table(path, header = T, sep = ";", na.strings = "?", colClasses = c("character", rep("NULL", 8)))
dates = as.Date(dates$Date, "%d/%m/%Y")
head(dates)
dates_range = which(dates == "2007-02-01" | dates == "2007-02-02") %>% range
skip = dates_range[1]
nrows = diff(dates_range)

# unzip file for only 2007-02-1 and 2007-02-02
dat = read.table(path, header = F, sep = ";", na.strings = "?", nrows = nrows,
                 skip = skip, colClasses = colclass, col.names = colnames)

write.csv(dat, "mydata.csv", row.names = F)
