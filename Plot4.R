

#Reads in data from file then subsets data for specified dates
dt <- data.table::fread(input = "./household_power_consumption.txt",na.strings = "?" )

# Convert global activer power to numeric
dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Concatinate date & time into 1 column so that date can be easily filtered
dt[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter dates for 2007-02-01 and 2007-02-02
dt <- dt[(dateTime >= "2007-02-01")&(dateTime < "2007-02-03")]


png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

## Plot1

hist(dt[[3]], main = "Global Active Power",xlab = "Global Active Power(kilowatts)",
     col = "red",xlim = c(0,6))

## Plot2

x = dt[[10]] # DateTime
v = dt[[5]] # Voltage
plot(x,v, xlab = "DateTime",ylab = "Voltage",type = "l",)

x = dt[[7]] #Sub_metering_1
y = dt[[8]] #Sub_metering_2
z = dt[[9]] #Sub_metering_3
t = dt[[10]]#DateTime

## Plot3

plot(t,x, xlab = "",ylab = "Energy-sub metering",type = "l")
lines(t,y, col = "red")
lines(t,z, col = "blue")
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "))

## Plot4

x = dt[[10]] # DateTime
r = dt[[4]] # Global Reative power
plot(x,r, xlab = "DateTime",ylab = "Global_Reative_power",type = "l",)

dev.off()

