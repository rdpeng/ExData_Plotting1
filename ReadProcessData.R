# Read the data form the original file
d_raw= read.table("household_power_consumption.txt", sep=";",header=TRUE,as.is=TRUE)

# Process data for use
dsub<-subset(d_raw,Date=="1/2/2007" | Date=="2/2/2007")  # Filter entire data set

# Convert susetted data to corrrect type
dsub$DateTime<-paste(dsub$Date,dsub$Time) # Create date-time entry
dsub$DateTime=strptime(dsub$DateTime,format="%d/%m/%Y %H:%M:%S") # Convert to correct format
dsub$Global_active_power<-as.numeric(dsub$Global_active_power)
dsub$Global_reactive_power<-as.numeric(dsub$Global_reactive_power)
dsub$Voltage<-as.double(dsub1$Voltage)
dsub$Sub_metering_1<-as.numeric(dsub$Sub_metering_1)
dsub$Sub_metering_2<-as.numeric(dsub$Sub_metering_2)
dsub$Sub_metering_3<-as.numeric(dsub$Sub_metering_3)

# Save subsetted data for use later
write.table(dsub,"household_power_consumption_reduced.txt", sep=";")
save("dsub", file="household_power_consumption_reduced.RData")
