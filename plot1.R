#####               MAKING PLOTS                       #######
##### Exercise from "exploratory data analysis" Course #######
#####                 plot1.png                        #######

### Working directory it's C:\\COSAS MIAS\\Programacion R.
### All the data of exercise it's inside "exploratory data analysis" directory





####  READING AND SELECTING THE DATA
x <- read.csv ("C:\\COSAS MIAS\\Programacion R\\exploratory data analysis\\household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)




#### This part selec the data of day 1, day 2, merges them on one only table, and erase the original data to save memory
        
y  <- x[x$Date == "1/2/2007", ]          
z  <- x[x$Date == "2/2/2007", ]    
data  <- rbind (y,z)

remove (x)  




####  PLOTING




### This part take Global active power and transform it into a numeric variable

kilowatts  <- as.numeric (data$Global_active_power)    




### Optional. this just print it on screen


hist (kilowatts, col = "red",main= "Global Active Power", xlab="Global Active Power (Kilowatts)" )  


#### this part plots the png.

png(filename="C:\\COSAS MIAS\\Programacion R\\exploratory data analysis\\plot1.png")                                            
hist (kilowatts, col = "red",main= "Global Active Power",   xlab="Global Active Power (Kilowatts)" )
dev.off()