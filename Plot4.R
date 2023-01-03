#Plot4.R
  install.packages("data.table")
  library(data.table)
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,file.path("dataFiles.zip"))
  unzip(zipfile="dataFiles.zip")

  dataFile <- "./data/household_power_consumption.txt"
  data <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
  consumption <- data[data$Date %n% c("1/2/2007","2/2/2007"),]

#Decided to change the name 
  Meter1 <- as.numeric(consumption$Sub_metering_1)
  Meter2 <- as.numeric(consumption$Sub_metering_2)
  Meter3 <- as.numeric(consumption$Sub_metering_3)
  Voltage <- as.numeric(consumption$Voltage)

#Test 1
  png("Plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
    #Plot1.png
      hist(consumption[,Global_active_power],main="Global Active Power", xlab="Global Active      Power(Kilowatts)",ylab="Frequency",col="red")
    #Plot2.png
      plot(datetime,consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
      plot(consumption[,dateTime],consumption[,Voltage],type='l', xlab="datetime",ylab="V")
    #Plot3.png
      plot(consumption$dateTime, Meter1, type='l',xlab="",ylab="Energy Submetering")
      lines(consumption$dateTime, Meter2, type='l', col="red")
      lines(consumption$dateTime, Meter3, type='l', col="blue")
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    #Plot4.png
      plot(consumption[, dateTime], consumption[,Global_reactive_power], type='l', xlab = "datetime", ylab="Global Reactive Power")
    dev.off()
