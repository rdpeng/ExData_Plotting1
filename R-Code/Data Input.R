This is the data input part.
  #Get full Dataset
  data_full <- read.csv("household_power_consumption.txt",header = T, sep = ";", na.string = "?", nrows = 2075259, check.names = F, stringAsFactor = F, comment.char = "", quote = '\"')
  #Convert Date
  data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%y")
  #Subset Data
  Data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(data_full)
