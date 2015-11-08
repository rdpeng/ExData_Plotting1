household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
res=household_power_consumption[household_power_consumption$Date > as.Date("2007/01/31"),]
res=res[res$Date<as.Date("2007/02/03"),]


## Plot2

png("Plot2.png", width=4, height=4, units="in", res=300)

plot(1:2880, as.numeric(as.vector(res$Global_active_power)), type = "l", xaxt = "n", xlab="", ylab = "Global Active Power (kilowatts)")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

dev.off()
