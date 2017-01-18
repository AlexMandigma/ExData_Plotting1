#code for reading the data and subsetting the data for 1/2/2007 and 2/2/2007
input<-read.table('C:/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
subdata<- subset(input, (input$Date == "1/2/2007" | input$Date== "2/2/2007"))
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(subdata$Sub_metering_1)
submetering2 <- as.numeric(subdata$Sub_metering_2)
submetering3 <- as.numeric(subdata$Sub_metering_3)

#code for plotting the data for plot3.png
  png("plot3.png", width = 480, height = 480)
  plot(datetime, submetering1, type="l", ylab= "Energy sub metering", xlab="")
  lines(datetime, submetering2, type="l", col="red")
  lines(datetime, submetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  dev.off()