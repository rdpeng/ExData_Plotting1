expl_assign <- read.csv2(file.choose(), dec = ".", stringsAsFactors = FALSE)
colnames(expl_assign)
head(expl_assign)
tail(expl_assign)
str(expl_assign)
expl_assign$Date <- as.Date(expl_assign$Date, format = "%d/%m/%Y")
str(expl_assign)


install.packages("lubridate")
library(lubridate)

str(sub_expl)
sub_expl<-subset(expl_assign, Date == "2007-02-01" | Date == "2007-02-02")

sub_expl$Time <- as.POSIXct(paste(sub_expl$Date, sub_expl$Time), format="%Y-%m-%d %H:%M:%S")

?strptime()
sub_expl$Global_active_power <- as.numeric(sub_expl$Global_active_power)
class(sub_expl$Global_active_power)

png("plot2.png")

with(sub_expl, plot(Time, Global_active_power, type = "l"))
dev.off()
     