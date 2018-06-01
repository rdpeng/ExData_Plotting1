# plot1.R
# ================================================================================================================
#> sessionInfo()
# R version 3.4.4 (2018-03-15)
# Platform: x86_64-pc-linux-gnu (64-bit)
# Running under: Ubuntu 16.04.4 LTS

# Matrix products: default
# BLAS: /usr/lib/libblas/libblas.so.3.6.0
# LAPACK: /usr/lib/lapack/liblapack.so.3.6.0

# locale:
#   [1] LC_CTYPE=de_DE.UTF-8       LC_NUMERIC=C               LC_TIME=de_DE.UTF-8        LC_COLLATE=de_DE.UTF-8    
# [5] LC_MONETARY=de_DE.UTF-8    LC_MESSAGES=de_DE.UTF-8    LC_PAPER=de_DE.UTF-8       LC_NAME=C                 
# [9] LC_ADDRESS=C               LC_TELEPHONE=C             LC_MEASUREMENT=de_DE.UTF-8 LC_IDENTIFICATION=C       

# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     

# other attached packages:
#   [1] curl_3.2

# loaded via a namespace (and not attached):
#   [1] compiler_3.4.4 tools_3.4.4   
# =======================================================================================================================

#  load the data from the internet, if not already loaded
 if (!file.exists("household_power_consumption.txt")) {
   # check if the curl package is installed
   if (!require(curl)) { print("Please install the curl package"); stop("this programm  uses curl to download the file")}
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    tmp <- tempfile()
    curl_download(url, tmp)
    unzip(tmp)    # extract "household_power_consumption.txt" from the zip file
    unlink(tmp)   # delete the temporary file
 }
# read the file
df <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  stringsAsFactors=FALSE, na.strings="?") 
str(df)

# add the date field as date class field 
df$datefield <- as.Date(df$Date, format="%d/%m/%Y")

# add  day, month and year as a numeric field  to the data frame and subset the data  
df$jjjj<- as.numeric(format(df$datefield,"%Y"))
df$mm<- as.numeric(format(df$datefield,"%m"))
df$dd<- as.numeric(format(df$datefield,"%d"))
dataset <- df[!is.na(df$Date) & df$jjjj==2007 & df$mm==2 & (df$dd==1 | df$dd==2), ]


dataset$weekdayshort <- format(dataset$datefield,"%a")
dataset$timestamp <- as.POSIXct(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")
str(dataset)

table(dataset$jjjj,dataset$mm)
table(dataset$dd,dataset$weekdayshort)


# create the first plot
# first try with the screen,
# then create the png  file

plot1 <- function(device="screen") {
  if (tolower(device) == "png")     png(filename = "plot1.png", width = 480, height = 480)
  if (tolower(device) == "jpeg")    jpeg(filename ="plot1.jpeg", width = 480, height = 480)
  # if (tolower(device) == "pdf")     pdf(file = "plot1.pdf", width = 480, height = 480)
  
  hist(dataset$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  if (tolower(device)!="screen")
     dev.off()
}  

plot1
plot1("png")
# plot1("jpeg")

