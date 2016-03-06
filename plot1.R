# setup of all of the file handles we'll use
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
localZipFile = "household_power_consumption.zip"
localDelimFile = "household_power_consumption.txt"
graphFile = "plot1.png"

# download and unzip the txt file
download.file(fileUrl, localZipFile, mode="wb")
unzip(localZipFile)

# read just the lines of data we want
# using skip and nrows allows reading just the lines we need (and only works because the
# data is ordered), but also forces reapplication of the column names
powerData = read.delim(localDelimFile, header=TRUE, sep=";", na.strings="?",
                       col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                                   "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                                   "Sub_metering_3"),
                       colClasses=c("character","character","numeric","numeric","numeric", "numeric",
                                    "numeric","numeric","numeric"),
                       skip=66636, nrows=2880)

# open the PNG file, perform the plot, and close the file
png(graphFile)
hist(powerData$Global_active_power, 
     breaks = 15, 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     main = "Global Active Power", 
     col="red")
dev.off()
