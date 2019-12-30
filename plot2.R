plot2<-function(file="household_power_consumption.txt"){
  #read two-day data
  twoday<-read.table(text = grep("^[1,2]/2/2007",readLines(file), value = TRUE), 
                     col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                     sep = ";", header = TRUE)
  
  #convert the format of date and time
  date_time<-paste(as.Date(twoday$Date,"%d/%m/%Y"),twoday$Time)
  twoday$date_time<-as.POSIXct(date_time)


  #plot2 
  with(twoday,plot(Global_active_power~date_time,type="l",xlab="",ylab="Global Active Power(kilowatts)"))
  dev.copy(png,"plot2.png")
  dev.off()
}