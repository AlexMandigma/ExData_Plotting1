
#code for reading the data and subsetting the data for 1/2/2007 and 2/2/2007
input<-read.table('C:/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
subdata<- subset(input, (input$Date == "1/2/2007" | input$Date== "2/2/2007"))
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subdata$Global_active_power)

#code for plotting the data for plot2.png
png("plot2.png", width = 480, height = 480)
plot(datetime, globalactivepower, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()


