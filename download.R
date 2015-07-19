rawUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
rawFile <- "data/raw/household_power_consumption.zip"

# only download if the file is not saved locally
if (!file.exists(rawFile)) {
    dir.create("data/raw", recursive = TRUE)
    download.file(rawUrl, destfile = rawFile, method = "curl")

    # record the date it was downloaded
    f <- file("data/raw/date_downloaded.txt")
    writeLines(date(), f)
    close(f)
}

# unzip the raw file into a working directory
unzip(rawFile, exdir = "data")
