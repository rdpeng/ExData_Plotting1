#  loading the dataset into R. 
# If you have the dataset .txt in your directory you can use this way: "./household_power_consumption.txt". Otherwise, please use ./data/household_power_consumption.txt
# Read.table is a function that read a file in table forma and creates a data frame from it.
# "./data/household_power_consumption.txt" is a file
# header to indicated whether the file contains the names of the variables as its first line
# sep=";" that means that values on each line are separated by ";". In other cases, I could be \t
# stringsAsFactors=FALSE means that characters vectors should be converted to factors. In this cases this factors are not necessary.
# the character used in the file for decimal points.
hpctxt <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# $ is an operator to subset 
# %in% is an operator to match 
# "c("1/2/2007","2/2/2007") ," means the vector that you want to match
subSethpctxt <- hpctxt[hpctxt$Date %in% c("1/2/2007","2/2/2007") ,]

# str(subSethpctxt) that step is necessary to create the subset  numbers that you want in your graphic. 
# subSethpctxt$Global_active_power are string of a character and you need as numeric
globalActivePower <- as.numeric(subSethpctxt$Global_active_power)


# png is a format bitmap files. That is the format that is gonna save the graphic. It is necessary to write before creating an any graphic
# it is gonna save in PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)
#  hist is a histogram, globalActivePower is of data that you put in your graphic.
# col is colour
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# dev.off is a function provides control over multiple graphics devices. In this case, close and save a graphic
dev.off()
