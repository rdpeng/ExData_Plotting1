#####               MAKING PLOTS                       #######
##### Exercise from "exploratory data analysis" Course #######
#####                 plot3.png                        #######

### Working directory it's C:\\COSAS MIAS\\Programacion R.
### All the data of exercise it's inside "exploratory data analysis" directory





####  READING AND SELECTING THE DATA
x <- read.csv ("C:\\COSAS MIAS\\Programacion R\\exploratory data analysis\\household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)




#### This part selec the data of day 1, day 2, merges them on one only table, and erase the original data to save memory
        
y  <- x[x$Date == "1/2/2007", ]          
z  <- x[x$Date == "2/2/2007", ]    
data  <- rbind (y,z)

remove (x)  



#### This part merges data and time in one column, and then coerced it as a date.

for (i in 1:nrow(data)){

     data$fecha [i]  <- paste (data[i,1], data[i,2],sep="-")
          }


data$fecha <- strptime(data$fecha ,"%e/%m/%Y-%H:%M:%S")



####  PLOTING


###Optional. this just shows the plot on the screen too.

plot (data$fecha,data$Sub_metering_1,type="n",ylab= "Energy sub metering",xlab= "")


lines (data$fecha,data$Sub_metering_1,type="l", col ="black")
lines (data$fecha,data$Sub_metering_2,type="l", col= "red")
lines (data$fecha,data$Sub_metering_3,type="l", col= "Blue")

legend ("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"), lty = c(1,1,1), lwd=c (2,2,2))

        
        
###This creates a file with the plot.

png(filename="C:\\COSAS MIAS\\Programacion R\\exploratory data analysis\\plot3.png") 

plot (data$fecha,data$Sub_metering_1,type="n",ylab= "Energy sub metering",xlab= "")

lines (data$fecha,data$Sub_metering_1,type="l", col ="black")
lines (data$fecha,data$Sub_metering_2,type="l", col= "red")
lines (data$fecha,data$Sub_metering_3,type="l", col= "Blue")

legend ("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"), lty = c(1,1,1), lwd=c (2,2,2))
dev.off()