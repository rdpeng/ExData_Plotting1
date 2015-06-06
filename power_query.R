power_consumption_plotting <- function() {
  
  if(!file.exists ("C:/DataScience/module 4/week1")){
    dir.create (("C:/DataScience/module 4/week1"))
  }
  
  if(!file.exists ("exdata-data-household_power_consumption.zip")){
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    file<-unz(temp)
    unlink(temp)
  if(!file.exists(saved_file)){
  }
  
  
  
  
}