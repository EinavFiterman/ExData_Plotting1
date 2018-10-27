# read data
data <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", 
                   skip = grep("1/2/2007",
                 readLines("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt")), 
                 nrows = 2880,
                 na.strings = "?",
                 sep = ";")
names(data) <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", 
                          nrows = 1, sep = ";", stringsAsFactors = FALSE)
# open PNG file
png("plot1.png", width = 480, height = 480) 

# create plot
hist(data$Global_active_power, main = "Global Active power", xlab = "Global Active power (kilowatts)", col = "red")

dev.off()