plot4<-function(file="household_power_consumption.txt"){
  #read two-day data
  twoday<-read.table(text = grep("^[1,2]/2/2007",readLines(file), value = TRUE), 
                     col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                     sep = ";", header = TRUE)
  
  png('plot4.png',480,480)
  #set the layout
  par(mfcol=c(2,2),mar=c(4,4,2,1))
  
  #convert the format of date and time
  date_time<-paste(as.Date(twoday$Date,"%d/%m/%Y"),twoday$Time)
  twoday$date_time<-as.POSIXct(date_time)
  
  #plot1 
  with(twoday,plot(Global_active_power~date_time,type="l",xlab="",ylab="Global Active Power"))
  
  #plot2
  plot(twoday$Sub_metering_1~twoday$date_time,xlab="",ylab="Energy sub metering",type="n")
  lines(twoday$Sub_metering_1~twoday$date_time,col="black")
  lines(twoday$Sub_metering_2~twoday$date_time,col="red")
  lines(twoday$Sub_metering_3~twoday$date_time,col="blue")
  legend("topright",cex=1,col=c("black","red","blue"),lty=1,lwd=1,seg.len=1.5,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #plot3
  plot(twoday$Voltage~twoday$date_time,type='l',xlab="datetime",ylab="Voltage")
  
  #plot4
  plot(twoday$Global_reactive_power~twoday$date_time,type="l",xlab="datetime",ylab="Global_reactive_power")

  dev.off()
}