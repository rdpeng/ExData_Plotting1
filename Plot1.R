#Ploting the Graph 1
data<- read.table('C:/Users/kiss/Desktop/cousera/data/cdata.txt', sep=';', 
                  header=T,na='?') #reading the textfile


data2<- within(electric,{Date<- as.Date(Date,'%d/%m/%Y')
                         }) # Setting the Date format to date

data3<- within(data2,{Datetime<- paste(Date,Time)
                       strptime(Datetime,'%Y-%m-%d %H:%M:%S')
                         }) #convert the Date and Time variables to Date/Time 
                            #classe

data4<- subset(data3, Date <= as.Date("2007-02-02") & 
                 Date >= as.Date("2007-02-01")) # subsetting 2007-02-01 and 
                      #2007-02-02 dataset from the the whole database
dim(data4) # checking the subset dataset

#Setting the resolution of the PNG Output
png(filename = "Plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
      restoreConsole = TRUE)

#Ploting the first graph

hist(data5$Global_active_power, col='red', main="Global Active Power", 
     xlab='Global Active Power(kilowatts)')

dev.off() #finish the image



