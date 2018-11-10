NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
NEIdp <- tbl_df(NEI)

EmissionsForYear = summarize(group_by(NEIdp, year), sum(Emissions))

colnames(EmissionsForYear) <- c("Year", "Emissions")

EmissionsForYear$EmissionsInMillions = EmissionsForYear$Emissions / 1000000

png('plot1.png')
barplot(EmissionsForYear$EmissionsInMillions, names.arg=EmissionsForYear$Year, col="blue", xlab='Years', ylab='Emissions (PM 2.5) in millions', main =  'Emissions (PM 2.5) per year')
dev.off()