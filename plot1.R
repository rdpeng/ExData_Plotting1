if(!file.exists("Assignment1_preproc.R"))
{
	stop("The data input and processing code, Assignment1_preproc.R is missing.  Make sure it's in working directory")
}


source("Assignment1_preproc.R")

	hist(df$Global_active_power,
		main="Global Active Power",
		col="red",
		xlab="Global Active Power (kW)")

	dev.copy(png, file="plot1.png", width=480, height=480)

	dev.off()

	cat("Done! plot1.png has been saved to", getwd())
