elec_data <- read.table("C:\\Users\\dv23229\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                        na = "?", sep=";", header = T, stringsAsFactors = F)
str(elec_data)
elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y")
str(elec_data)
elec_data <- subset(elec_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
rownames(elec_data) <- NULL
elec_data$Date_Time <- with(elec_data, strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"))
elec_data$Day <- factor(weekdays(elec_data$Date), levels = c("Thursday", "Friday"))