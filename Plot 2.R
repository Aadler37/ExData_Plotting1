## Read in dataset 
electric <- read.table("household_power_consumption.txt", sep=";",skip = 66637, nrows = 2880)

##Rename columns
colnames(electric) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


## Create a numeric variable
global2 <- as.numeric(electric$Global_active_power)
date_time <- strptime(paste(electric$Date, electric$Time), "%Y-%m-%d %H:%M:%S") 
date_time <- as.POSIXct(electric$datetime)

## Create line graph of Global Active Power by day 
png("plot2.png", width=480, height=480)
plot(date_time, global2, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
