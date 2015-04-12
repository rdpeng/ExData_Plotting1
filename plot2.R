if(!file.exists("Assignment1_preproc.R"))
{
	stop("The data input and processing code, Assignment1_preproc.R is missing.  Make sure it's in working directory")
}

source('Assignment1_preproc.R')

	plot(df$timestamp, df$Global_active_power,
		type="l",
		xlab="",
		ylab="Global Active Power (kW)")

	dev.copy(png, file="plot2.png", width=480, height=480)

	dev.off()

	cat("Done! plot2.png has been save to", getwd())