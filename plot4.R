# Data Science Specialization
# Johns Hopkins University - Coursera
# Exploratory Data Analysis
# Carlos Rodriguez-Contreras
# Script to produce the plot 4
# Retrieving the zipped file from the internet:

datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datasetURL, destfile = "zippedFile.zip", method = "curl")

# Unzip the dataset into work directory:
unzip("zippedFile.zip")
list.files()
EPC.complete <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
EPC <- EPC.complete[EPC.complete$Date %in% c("1/2/2007", "2/2/2007"), ]
EPC$Date <- paste(EPC$Date, EPC$Time, sep = " ")
EPC$Time <- NULL
EPC$Date <- strptime(EPC$Date, "%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "English") # Does not function in my system

# Generates a multi-plot 2 x 2

# Preparing the graphic output
opar <- par()
par(mfrow=c(2,2))
# First plot:
plot(EPC$Date, EPC$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "datetime")

# Second plot:
plot(EPC$Date, EPC$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Third plot:
plot(EPC$Date, EPC$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "datetime")
lines(EPC$Date, EPC$Sub_metering_2, type = "l", col = "red")
lines(EPC$Date, EPC$Sub_metering_3, type = "l", col = "blue")
legend("top", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = .6, lwd = 2, col = c("black","red","blue"), bty = "n")

# Fourth plot:
plot(EPC$Date, EPC$Global_reactive_power, type = "l", ylab = "Global reactive power", xlab = "datetime")

# Resetting original parameters:
par(opar)