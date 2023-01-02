#Plot1.R 
  install.packages("data.table")
  library(data.table)
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, file.path("dataFiles.zip"))
  unzip(zipfile = "dataFiles.zip")
  
  dataFile <- "./data/household_power_consumption.txt")
  data <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
  data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Filter Dates for 1/2/2007 - 2/2/2007
  consumption <- data[data$Date %n% c("1/2/2007","2/2/2007"),]

#Plot1
  png("Plot1.png", width=480, height=480)
  hist(consumption[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
