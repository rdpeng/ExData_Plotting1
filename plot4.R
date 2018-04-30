library(dplyr)
library(lubridate)
library(ggplot2)
library(scales)
library(ggpubr)

#Read from data .txt file in working directory
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Mutate Date/Time variable into dataframe and subset to the two days we are concerned with
subset <- data %>%
  as_tibble() %>%
  mutate(datetime = dmy_hms(paste(Date, Time))) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate_at(.vars = 3:9, as.numeric)

#Open png file and write plot to file
plota <- ggplot(subset, aes(datetime, Global_active_power)) +
  geom_path() +
  scale_x_datetime(labels = date_format("%a"),breaks = date_breaks("1 days")) +
  xlab("") +
  ylab("Global Active Power (kilowatts") +
  theme_bw()

plotb <- ggplot(subset, aes(datetime, Voltage)) +
  geom_path() +
  scale_x_datetime(labels = date_format("%a"),breaks = date_breaks("1 days")) +
  xlab("") +
  ylab("Voltage") +
  theme_bw()

plotc <- ggplot(subset, aes(datetime, Sub_metering_1)) +
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

plotd <- ggplot(subset, aes(datetime, Global_reactive_power)) +
  geom_path() +
  scale_x_datetime(labels = date_format("%a"),breaks = date_breaks("1 days")) +
  xlab("") +
  ylab("Global Reactive Power (kilowatts") +
  theme_bw()

ggarrange(plota, plotb, plotc, plotd)

ggsave("plot4.png")
