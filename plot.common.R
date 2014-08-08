###############################################################################
#
#   plot.common
#   Author: Eugene Jarder
#
###############################################################################

zip.file <- function()
{
    file.path('https://d396qusza40orc.cloudfront.net',
              'exdata%2Fdata%2Fhousehold_power_consumption.zip')
}

download.zip.call.function <- function(out.file, process.function)
{
    random.filename <- paste(sample(c(0:9, letters, LETTERS),
                                    8, replace=TRUE), collapse='')
    
    temp.zip <- file.path(tempdir(), paste(random.filename, '.zip', sep = ''))
    download.file(zip.file(), temp.zip, quiet = TRUE)
    
    unzip.path <- file.path(tempdir(), random.filename)
    unzip(temp.zip, exdir = unzip.path)
    
    draw.to.png(out.file, process.function, unzip.path)
    
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

sub.metering.labels <- function()
{
    paste0('Sub_metering_', 1:3)
}

format.power.data <- function(power.data)
{
    power.date.time <- paste(power.data$V1, power.data$V2)
    power.date.time <- strptime(power.date.time, format = '%d/%m/%Y %H:%M:%S')

    power.data <- cbind(power.date.time, power.data[3:9])

    colnames(power.data) <- c('Date.Time', 'Active.Power', 'Reactive.Power',
                              'Voltage', 'Intensity', sub.metering.labels())

    power.data
}

draw.to.png <- function(out.file, draw.function, working.directory)
{
    png(filename = out.file, bg = 'transparent')
    tryCatch(
        {
            power.data <- read.power.consumption.data(working.directory)
            draw.function(power.data)
        },
        finally =
        {
            dev.off()
        }
    )
}

plot.to.png <- function(out.file, draw.function, working.directory = NULL)
{
    if (is.null(working.directory))
    {
        download.zip.call.function(out.file, draw.function)
    }
    else
    {
        draw.to.png(out.file, draw.function, working.directory)
    }
}
