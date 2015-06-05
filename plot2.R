powerdat <- read.csv("~/Documents/R/Coursera/household_power_consumption.txt", 
        sep=";", na.strings = "?", stringsAsFactors = FALSE)
datetime<- paste(powerdat[,1], powerdat[,2],sep = ",")
datetime<- strptime(datetime,"%d/%m/%Y,%T")
powerdat <- cbind(powerdat,datetime)
with(powerdat, plot(datetime,Global_active_power, ylab = 
        "Global Active Power (kilowatts)", type = "l"))
dev.copy(device = png, file = "plot2.png") #saves plot from r as a png
dev.off()
