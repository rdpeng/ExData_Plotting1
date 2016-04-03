# The file to read the data about household power consumption and
# return a dataframe to work with later

read_data <- function(file) {
  dataset <- read.table(file, header = TRUE, sep = ';', 
                           na.strings = "?", stringsAsFactors = FALSE);
  dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y");
  dataset$Time <- format(dataset$Time, format = "%H:%M:%S");
  valid.dataset <- subset(dataset, 
                          Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'));
  return (valid.dataset);
}