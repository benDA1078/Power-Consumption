#Plot3.R 
  install.packages("data.table")
  library(data.table)
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(url,file.path("dataFiles.zip"))
	unzip(zipfile="dataFiles.zip")

  dataFile <- "./data/household_power_consumption.txt")
	data <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
	consumption <- data[data$Date %n% c("1/2/2007","2/2/2007"),]

#Decieded to change the name 
	Meter1 <- as.numeric(consumption$Sub_metering_1)
	Meter2 <- as.numeric(consumption$Sub_metering_2)
	Meter3 <- as.numeric(consumption$Sub_metering_3)

#Plot3.png 
#20-25 is showing an error with (type = ""), so left it out until code can be figured out in RStudio 
    #Lasted updated (1-2-2023)
  png("Plot3.png", width = 480, height = 480)
  plot(consumption$dateTime, xlab="",ylab="Energy Submetering")
  lines(consumption$dateTime, Meter1, col="black")
  lines(consumption$dateTime, Meter2, col="red")
  lines(consumption$dateTime, Meter3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=1, col=c("black", "red", "blue"))
  
#Plot3.png
	##Figured out the issue with the old code. This code is functional in RStudio
	##Updated (1-3-2023)
		plot(consumption$dateTime, Meter1, type='l',xlab="",ylab="Energy Submetering")
		lines(consumption$dateTime, Meter2, type='l', col="red")
		lines(consumption$dateTime, Meter3, type='l', col="blue")
		legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
