data = read.csv('household_power_consumption.txt', header=T, sep=";", stringsAsFactors = FALSE)
data3 = data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

for (i in 3:9) {
  data3[,i] = as.numeric(data3[,i])
}