#Course 4 Exploratory Data Analysis, Wk 1 Project
#File is large ~ 2.1 million * 90 bytes ~ 200MB
#View format of data by reading in first few rows
initial <- read.table("household_power_consumption.txt", nrows = 10) 
initial#shows that the separation char is ";"
initial <- read.table("household_power_consumption.txt", nrows = 10,sep = ';')
View(initial)
#Can Use SQL to select specific rows
#install.packages("sqldf")
#library(sqldf)
#input <- read.csv.sql("household_power_consumption.txt",
#"select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
#sep=";")
#It does not allow for NA management and turns all ? into 0s
#Better just to use read.table and extract operator "["
power = read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep=";",
                  dec = ".",
                  na.strings = "?",
                  stringsAsFactors = FALSE)
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
str(power)
head(power)
png(filename = "plot1.png", width = 480, height = 480,
    units = "px")
hist(power$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
