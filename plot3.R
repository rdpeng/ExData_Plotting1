library(tidyverse)
library(data.table)
library(lubridate)
library(plotly)

theme_set(theme_classic() + theme(axis.text=element_text(size=12),
                                  axis.title=element_text(size=12,face="bold")))

options(warn=-1)
path <- getwd()

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "data.zip"))
unzip(zipfile = "data.zip")
dt <- fread("household_power_consumption.txt", na.strings = "?")
head(dt)
dt <- filter(dt, Date %in%  c("1/2/2007", "2/2/2007"))
g3 <- ggplot(data=dt) +
  geom_line(aes(dateTime, Sub_metering_1)) +
  geom_line(aes(dateTime, Sub_metering_2), col="red") +
  geom_line(aes(dateTime, Sub_metering_3), col="blue") +
  labs(x="time", y="Global Active Power (kilowatts)")

ggplotly(g3)