###############################################################################
#
#   plot.common
#   Author: Eugene Jarder
#
###############################################################################

download.zip.call.function <- function(url.zip, process.function)
{
    random.filename <- paste(sample(c(0:9, letters, LETTERS),
                                    8, replace=TRUE), collapse='')
    
    temp.zip <- file.path(tempdir(), paste(random.filename, '.zip', sep = ''))
    download.file(url.zip, temp.zip, quiet = TRUE)
    
    unzip.path <- file.path(tempdir(), random.filename)
    unzip(temp.zip, exdir = unzip.path)
    
    process.function(unzip.path)
    
    unlink(unzip.path, recursive = TRUE)
    unlink(temp.zip)
}

read.power.consumption.data <- function(data.directory)
{
    data.file <- file.path(data.directory, 'household_power_consumption.txt')
    
    # First two columns are characters, the rest are numeric
    data.column.classes <- c(rep('character', 2), rep('numeric', 7))

    # get only data from 01/02/2007 to 02/02/2007, which start from row
    # 66638 and has 2880 entries
    power.data <- read.table(data.file, header = FALSE, sep = ';',
                           colClasses = data.column.classes, na.strings = '?',
                           skip = 66637, nrows = 2880)
    
    format.power.data(power.data)
}

format.power.data <- function(power.data)
{
    power.data$V1 <- as.Date(power.data$V1, '%d/%m/%Y')
    power.data$V2 <- as.Date(power.data$V2, '%H:%M:%S')
    
    power.data
}
