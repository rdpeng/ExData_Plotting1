#load prepared data
source('preparedData.r')

#plot2
#Weekdays are named German in the plot ("Do"="Thu","Fr"="Fri","Sa"="Sat")
png("Plots/Plot2.png")
plot(Power.Subset$Time,Power.Subset$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()