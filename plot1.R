
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
res=household_power_consumption[household_power_consumption$Date > as.Date("2007/01/31"),]
res=res[res$Date<as.Date("2007/02/03"),]


## Plot1

png("Plot4.png", width=480, height=480, units="px")
hist(as.numeric(as.vector(res$Global_active_power)),col = "red")
dev.off()
