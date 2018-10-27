# read data
data <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", 
                   skip = grep("1/2/2007",
                               readLines("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt")), 
                   nrows = 2880,
                   na.strings = "?",
                   sep = ";")
names(data) <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", 
                          nrows = 1, sep = ";", stringsAsFactors = FALSE)

datetime <- as.POSIXct(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
# create plots
with(data, {
        plot(datetime ,as.character(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")
        plot(datetime ,as.character(Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
        plot(datetime ,Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        with(data, points(datetime ,Sub_metering_2, type = "l", col = "red")) 
        with(data, points(datetime ,Sub_metering_3, type = "l", col = "blue")) 
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
        plot(datetime ,as.character(Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.copy(png, file = "plot4.png") # copy plot4 to a PNG file
dev.off()