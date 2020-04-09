library(dplyr)
power <- read.csv(file = "power.txt",sep = ";", stringsAsFactors = F)
power_date <- power %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
power_date_target <- power_date %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") 
power_date_target[3:8] <- sapply(power_date_target[3:8],as.numeric)

png(filename = "plot1.png",width = 480, height = 480)
act_pow <- hist(power_date_target$Global_active_power, 
                col = "red", 
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power")
dev.off()
