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
# create plot
with(data, plot(datetime ,Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")) 
with(data, points(datetime ,Sub_metering_2, type = "l", col = "red")) 
with(data, points(datetime ,Sub_metering_3, type = "l", col = "blue")) 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)

dev.copy(png, file = "plot3.png") # copy plot3 to a PNG file
dev.off()