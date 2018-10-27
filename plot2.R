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

# open PNG file
png("plot2.png", width = 480, height = 480) 
# create plot
with(data, plot(datetime ,as.character(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()