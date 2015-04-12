if(!file.exists("Assignment1_preproc.R"))
{
        stop("The data input and processing code, Assignment1_preproc.R is missing.  Make sure it's in working directory")
}

source('Assignment1_preproc.R')

if(!file.exists("fcn_plot3.R"))
{
        stop("The src needed for plot 3 is missing.  Make sure fcn_plot3.R is in working directory")
}
source("fcn_plot3.R")

        # mfrow or mfcol, doesn't matter in this case
        par(mfrow = c(2,2))

        #plot 1
        plot(df$timestamp, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

        #plot 2
        plot(df$timestamp, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

        #plot 3
        plot3()

        #plot 4
        plot(df$timestamp, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

        # Output to external file
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
        cat("Done!  plot4.png has been saved in", getwd(), " This wraps up Ass1")
