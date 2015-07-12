# Data Science Specialization
# Johns Hopkins University - Coursera
# Exploratory Data Analysis
# Carlos Rodriguez-Contreras
# Script to produce the plot 1
# Retrieving the zipped file from the internet:

datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datasetURL, destfile = "zippedFile.zip", method = "curl")

# Unzip the dataset into work directory:
unzip("zippedFile.zip")
list.files()
EPC.complete <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
EPC <- EPC.complete[EPC.complete$Date %in% c("1/2/2007", "2/2/2007"), ]
EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")

# Generates a histogram for Global Active Power
hist(EPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")
