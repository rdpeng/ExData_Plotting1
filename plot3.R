+#################################################################################
+## Course: Exploratory Data Analysis                                           ##
+## Project 1                                                                   ##
+## Script: plot33.R                                                             ##  
+## This is the required file that constructs the graphic file plot3.png.       ##  
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
+## This plot is for the Energy Submetering vs DateTime 
+## Hence only the cols1,2,7,8,9 needs to be read, using colClasses.
+
+(cols <- c("character", "character", rep("numeric", 7))) 
+## For this script , only need the col1,col2,col7-col9: Date, Time, sub metering 1 -3
+## cols 3 to 6 not to be considered: Global active power, Global reactive power, 
+## voltage and Global Intensity
+colsOmitted <- 3:6    
+cols[colsOmitted] <- rep("NULL",length(colsOmitted))   ## Clear the cols 3-6 with NULL
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
+##################################################################
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
+###################################################################
+## STEP3: Plotting of the energy submetering (1-3) vs DateTime   ## 
+###################################################################
+
+## Set the locale to get "Thu, Fri, Sat".
+Sys.setlocale("LC_TIME", "C")  # turn off locale-specific sorting,
+
+## Set the active plotting device to png with the desired size (480x480),
+## and transparent background (similar to example).
+png(filename = "plot3.png", width = 480, height = 480, units = "px",
+    pointsize = 11.75, bg = "transparent")
+
+## Plot the Sub_metering_1 datasets 
+plot(DateTime, GlobalActivePower$Sub_metering_1,type="l",
+     main="", xlab="", ylab="Energy sub metering", col="black")
+
+## plot the remaining Sub_metering_2 and Sub_metering_3 datasets:
+lines(DateTime, GlobalActivePower$Sub_metering_2, type="l", col="red")
+lines(DateTime, GlobalActivePower$Sub_metering_3, type="l", col="blue")
+
+## Creating the Legend. 
+legend("topright", lty=1,col=c("black","red","blue"),
+      legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
+
+## close the device to release the png file created
+dev.off()
+
+############################################
+## End of script plot33.R
