## N. Thompson
## Coursera Course, Exploratory Data Analysis, Assignment 01
## 6/7/2020

# Load some important functions and packages
## Set it up the script
if(T){  ## PREAMBLE ## Set it up the script
        clear <- function(x){
                x = cat("\f")
        }
        
        ipak <- function(pkg){
                new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
                if (length(new.pkg)) 
                        install.packages(new.pkg, dependencies = TRUE)
                sapply(pkg, require, character.only = TRUE)
        }
        
        helpCon <- function(topic, format=c("text", "html", "latex", "Rd"),lines=NULL, before=NULL, after=NULL) {  
                format=match.arg(format)
                if (!is.character(topic)) topic <- deparse(substitute(topic))
                helpfile = utils:::.getHelpFile(help(topic))
                
                hs <- capture.output(switch(format, 
                                            text=tools:::Rd2txt(helpfile),
                                            html=tools:::Rd2HTML(helpfile),
                                            latex=tools:::Rd2latex(helpfile),
                                            Rd=tools:::prepare_Rd(helpfile)
                )
                )
                if(!is.null(lines)) hs <- hs[lines]
                hs <- c(before, hs, after)
                cat(hs, sep="\n")
                invisible(hs)
        }
        is.sorted <- function(x = NULL) {
                if(all(sort(x, decreasing = FALSE) == x)) {
                        return(TRUE)
                } else {
                        return(FALSE)
                }
        }
        # Install and Load Packages
        packages <- c("chron",
                      "hms",
                      "lubridate",
                      "rio", 
                      "tidyverse")
        ipak(packages)
   
        ## Clean up the working environment
        ## # Total Environment Wipe
        rm(list = ls()) 
        
        ## Keep unique functions defined in this script
        rm(list=setdiff(ls(), c("clear", "ipak", "is.sorted", "packages", "helpCon")))
        
} ## PREAMBLE, Set it up the script

## The data is on local host, the following the process I followed to build the 
## final data set that is uploaded to the gitrepo.  This data set is too 
## large to place on GitHub.  I expect the grader to have a local copy and
## import data accordingly.  I recommend using the library(rio), which is
## included in the preamble above.

#### BREAK 00 - DATA Initial 00 #####
DATA00 <- import("./household_power_consumption.txt", colClasses = "character", na.strings = "?") # import, change "?" to NA.

sapply(DATA00, function(x) sum(is.na(x))) # check to make sure NAs present

DATA00$Date <- as.Date(DATA00$Date, format = "%d/%m/%Y") # convert the Date column to `Date` format
DATA00 <- DATA00 %>%
        filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

#### BREAK 01 - DATA Shortcut 01 ####
str(DATA00)
DATA01 <- paste(DATA00$Date, DATA00$Time) # create new object that is just the date and time columns of the data set
str(DATA01)
DATA00$DateTime <- as.POSIXct(DATA01) # add the new column to the main data set
str(DATA00)
DATA00 <- DATA00 %>% # rearrange dataset to keep the dates and times together
        select(Date, 
               Time, 
               DateTime, 
               Global_active_power, 
               Global_reactive_power, 
               Voltage, 
               Global_intensity, 
               Sub_metering_1, 
               Sub_metering_2, 
               Sub_metering_3)
DATA00[,4:10] <- sapply(DATA00[,4:10],as.numeric) # convert all remaining columns to numeric for analysis

DATA00 <- DATA00 %>% # select only the dates used for the analysis
        filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
str(DATA00)


#### PLOT 01  ####
## Plot 1: Global Active Power vs Frequency of Use
png("./plot1.png", width = 480, height = 480) ## Open png file
hist(DATA00$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") ## Create the plot (histogram) `Global Active Power (KW)` (frequency)
dev.off() ## # Close the file

#### PLOT 02 ####
## Plot 2: Global Active Power over Time
png("~/Documents/gitrepos/DataAnalysis/ExData_Plotting1/plot2.png", width = 480, height = 480) ## Open png file
plot(DATA00$Global_active_power ~ DATA00$DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l") ## Create the plot Global Active Power on the y-axis and DateTime on the x-axis.
dev.off() ## # Close the file

#### PLOT 03 ####
## Plot 3: Energy Sub-Metering over Time
png("./plot3.png", width = 480, height = 480) ## Open png file
plot(DATA00$Sub_metering_1 ~ DATA00$DateTime, ylab = "Energy sub metering", xlab = "", type = "l") ## Base plot sub-metering (black lines)
lines(DATA00$Sub_metering_2 ~ DATA00$DateTime, col = 'Red') ## Add sub-metering (red lines)
lines(DATA00$Sub_metering_3 ~ DATA00$DateTime, col = 'Blue') ## Add sub-metering (blue lines)
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1) ## Add a legend
dev.off() ## # Close the file

#### PLOT 04 ####
#E Plot 4: Global Active Power/Voltage/Energy sub-metering/Global Machine Power over Time
png("./plot4.png", width = 480, height = 480) ## Open png file
par(mfrow = c(2,2)) ## Establish a 4x4 plot area
plot(DATA00$Global_active_power ~ DATA00$DateTime, ylab = "Global Active Power", xlab = "", type = "l") ## top left corner plot, GLobal Active Power over time
plot(DATA00$Voltage ~ DATA00$DateTime, ylab = "Voltage", xlab = "datetime", type = "l") ## top right corner plot, Voltage over datetime
plot(DATA00$Sub_metering_1 ~ DATA00$DateTime, ylab = "Energy sub metering", xlab = "", type = "l") ## bottom left corner plot(BLCP), black lines
lines(DATA00$Sub_metering_2 ~ DATA00$DateTime, col = 'Red') ## BLCP, red lines 
lines(DATA00$Sub_metering_3 ~ DATA00$DateTime, col = 'Blue') ## BLCP, blue lines
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1) ## BLCP legend
plot(DATA00$Global_reactive_power ~ DATA00$DateTime, ylab = "Global_reactive_power", xlab = "datetime", type = "l") ## bottom right corner plot, Global Reactive Power over datetime 
dev.off() ## # Close the file


