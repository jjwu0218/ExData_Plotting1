plot1<-function(file="household_power_consumption.txt"){
  #read two-day data
  twoday<-read.table(text = grep("^[1,2]/2/2007",readLines(file), value = TRUE), 
                     col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                     sep = ";", header = TRUE)
  #plot 1
  hist(twoday$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
  dev.copy(png,"plot1.png")
  dev.off()
}