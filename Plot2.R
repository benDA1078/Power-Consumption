#Plot2.R
  install.packages("data.table")
	library(data.table)
	url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(url,file.path("dataFiles.zip"))
	unzip(zipfile="dataFiles.zip")

  dataFile <- "./data/household_power_consumption.txt")
	data <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
	consumption <- data[data$Date %n% c("1/2/2007","2/2/2007"),]
	datetime <- strptime(paste(consumption$Date, consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  #kept receiving an error code abot "as.POSIXct", so found a source from "mGalarnyk/datasciencecoursera/4_Exploratory_Data_Analysis/project1"
  consumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
  consumption <- consumption[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
  
#Plot2.png
  png("plot2.png", width=480, height=480)
	plot(datetime,consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power 	(kilowatts)")
	dev.off()
