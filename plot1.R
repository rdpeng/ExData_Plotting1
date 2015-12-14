
R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> setwd("C:/Users/khollis/Documents/R/data")
> house_power <- read.table("household_power_consumption.txt", header=T, sep=";")
> house_power$Date <- as.Date(house_power$Date, format="%d/%m/%Y")
> df <- house_power[(house_power$Date=="2007-02-01") | (house_power$Date=="2007-02-02"),]
> df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
> df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
> df$Voltage <- as.numeric(as.character(df$Voltage))
> df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
> df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
> df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
> df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
> hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
> dev.copy(png, file="plot1.png", width=480, height=480)
png 
  3 
> dev.off()
windows 
      2 
> cat("Plot1.png has been saved in", getwd())
Plot1.png has been saved in C:/Users/khollis/Documents/R/data> 
