library(dplyr)
library(lubridate)
library(ggplot2)
library(scales)

#Read from data .txt file in working directory
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Mutate Date/Time variable into dataframe and subset to the two days we are concerned with
subset <- data %>%
  as_tibble() %>%
  mutate(datetime = dmy_hms(paste(Date, Time))) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate_at(.vars = 3:9, as.numeric)

#Open png file and write plot to file
ggplot(subset, aes(datetime, Sub_metering_1)) +
  geom_path(aes(color = "Sub_metering_1")) +
  geom_path(data = subset, mapping= aes(datetime, Sub_metering_2, color = "Sub_metering_2")) +
  geom_path(data = subset, mapping= aes(datetime, Sub_metering_3, color = "Sub_metering_3")) +
  labs(color = "Legend") +
  scale_x_datetime(labels = date_format("%a"),breaks = date_breaks("1 days")) +
  xlab("") +
  ylab("Energy sub metering") +
  theme_bw() +
  theme(legend.position = "top") +
  scale_colour_manual(values = c("black", "red", "blue"))

ggsave("plot3.png")
