#dowload the file necessary to the rest of the code
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#read in the data
pwr <- read.table("./household_power_consumption.txt",header = TRUE,sep=";")
pwr$Date <- as.Date(pwr$Date,format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time,"%H:%M:%S")
pwr$Global_active_power <- as.numeric(as.character(pwr$Global_active_power))

#subset on the two days we want to focus on
focus <- subset(pwr,Date >= "2007-02-01" & Date <= "2007-02-02")# & Global_active_power != "?")

#open png device, create histogram, turn off png device
png(file="./plot1.png",width=480,height=480,units="px")
hist(focus$Global_active_power,col="red",main="Global Active Power")#,xlim=c(0,6),breaks=12,xlab="Global Active Power (kilowatts)")
dev.off()

