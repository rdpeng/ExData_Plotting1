+#################################################################################
+## Course: Exploratory Data Analysis                                           ##
+## Project 1                                                                   ##
+## Script: plot44.R                                                             ##  
+## This is the required file that constructs the graphic file plot4.png.       ##  
+##                                                                             ##
+## The script reads the unzipped data file: household_power_consumption.txt    ##
+## in the Working Directory.                                                   ##
+## Please unzip the downloaded dataset into the working directory.             ##
+#################################################################################
+
+##############################
+## STEP1: Read the datasets ##
+##############################
+
+txtFileName <- "household_power_consumption.txt"
+
+## read.table is used to read the data,
+## Since we are interested in the data range from 2007-02-01 and 2007-02-02,
+## the portions of the datasets before 1/2/2007 0:00 and after 2/2/2007 23:59 will be omitted
+## Hence the reading will skip the first 66637 rows (datasets before 1/2/2007 0:00)  
+## The datasets are arranged in intervals of 1 minute hence from 1/2/2007 00:00:00 till 2/2/2007 23:59:00
+## the script needs to read 2x24x60 lines (days X hrs X mins) = 2880 rows of the datasets
+## 
+## This script plots 4 graphs:
+## 1. GlobalActivePower Vs DateTime (Plot2.R)
+## 2. Energy submetering vs DateTime (Plot3.R)
+## 3. Voltage Vs DateTime
+## 4. Global reactive power Vs DateTime
+########################################################################
+
+## The columns read using colClasses are different in other project files. 
+(cols <- c("character", "character", rep("numeric", 7)))
+## For this script we will load all the columns (though col. 6 is not used).
+colsOmit <- c()
+cols[colsOmit] <- rep("NULL",length(colsOmit))
+
+## Need to read in the header as it will be omitted in the reading of the datasets
+TableHeader <- 
+  read.table(txtFileName, header=TRUE, na.strings="?", nrows=1, sep=";", 
+             check.names=TRUE, colClasses=cols)
+
+## Read in the datasets from 1/2/2007 0:00 to 2/7/2007 23:59
+GlobalActivePower <- 
+  read.table(txtFileName,sep=";", skip=66637, 
+             nrows=(2*24*60), na.strings="?", colClasses=cols)
+
+
+## insert back the headernames back into the extracted datasets in GlobalActivePower
+names(GlobalActivePower) <- names(TableHeader)
+
+## For testing of the headers and datasets loaded. 
+#  head(GlobalActivePower)  ## to check the header and start of dataset
+#  tail(GlobalActivePower) ## to check the end of dataset (date: 2/7/2007 time:23:59)
+
+##############################################################
+## STEP2: Manipulating date and time                            ##
+## using strptime to convert between character representations  ##
+## and objects of classes "POSIXlt" and "POSIXct" representing  ##
+## calendar dates and times.                                    ##
+##################################################################
+
+## Extract the Date and Time cols from the first two columns of GlobalActivePower. 
+Extract_DateTimeCols <- paste(GlobalActivePower$Date, GlobalActivePower$Time, sep=" ")
+
+## strptime converts both the extracted cols to the desired data type.
+DateTime <- strptime(Extract_DateTimeCols, format="%d/%m/%Y %H:%M:%S")
+
+## For checking of the headers/tail of DateTime list. 
+## head(DateTime)
+## tail(DateTime)
+
+########################################
+## STEP3: Plotting of the the 4 plots ## 
+########################################
+
+## Set the locale to get "Thu, Fri, Sat".
+Sys.setlocale("LC_TIME", "C")  # turn off locale-specific sorting,
+
+## Set the active plotting device to png with the desired size (480x480),
+## and transparent background (similar to example).
+png(filename = "plot4.png", width = 480, height = 480, units = "px",
+    pointsize = 11.75, bg = "transparent")
+
+## Use of par and mfrow to prepare the 2x2 plots arrangement.
+par(mfrow=c(2, 2))
+
+## Plotting Top left, similar to plot 2: the Global Active Power data vs DateTime (note that the y axis label is different)
+plot(DateTime, GlobalActivePower$Global_active_power,
+     type="l", main="", xlab="", ylab="Global Active Power")
+
+## Plotting top right plot: Voltage Vs DateTime
+plot(DateTime,GlobalActivePower$Voltage, 
+     type="l", main="", xlab= "datetime", ylab="Voltage")
+
+## Plotting bottom left plot, is similar to plot3: Energy Submeterings 
+plot(DateTime, GlobalActivePower$Sub_metering_1,type="l",
+     main="", xlab="", ylab="Energy sub metering", col="black")
+lines(DateTime, GlobalActivePower$Sub_metering_2, type="l", col="red")
+lines(DateTime, GlobalActivePower$Sub_metering_3, type="l", col="blue")
+## Creating the Legend
+legend("topright", lty=1,col=c("black","red","blue"), box.lty=0,
+       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
+
+## Plotting bottom right plot: Global reactive power vs DateTime 
+plot(DateTime, GlobalActivePower$Global_reactive_power, type = "l", 
+     xlab = "datetime",ylab = "Global_reactive_power")
+
+## close the device to release the png file created
+dev.off()
+
+############################################
+## End of script plot44.R
