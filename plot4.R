createplot4 <- function() {
  
  reqdata <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, nrows = 70000)
  library(lubridate)
  reqdata$Date <- dmy(reqdata$Date)
  
  ## subset Feb 1 and 2 data
  febdata<-subset(reqdata,format.Date(Date,"%m")=="02" & format.Date(Date,"%Y")=="2007")
  feb12data <- subset(febdata, (format.Date(Date,"%d")=="01") | (format.Date(Date,"%d")=="02"))
  
  ## Combine date and time columns
  feb12data$newdate <- with(feb12data,ymd_hms(paste(Date,Time)))
  
  ## set 2 rows and 2 cols for graphs with mfrow function
  par(mfrow=c(2,2), mar=c(5,5,1,1))
  
  ## plot 1st graph
  plot(feb12data$newdate,as.numeric(as.character(feb12data$Global_active_power)),type = "l",xlab="",ylab = "Global Active Power(kilowatts)")
  
  ##plot 2nd graph
  plot(feb12data$newdate,as.numeric(as.character(feb12data$Voltage)),type = "l",xlab="datetime",ylab="Voltage")
  
  ##plot 3rd graph
  plot(feb12data$newdate,as.numeric(as.character(feb12data$Sub_metering_1)),col="black",type = "l",xlab="",ylab="Energy sub metering")
  lines(feb12data$newdate,as.numeric(as.character(feb12data$Sub_metering_2)),col="red",type = "l")
  lines(feb12data$newdate,as.numeric(as.character(feb12data$Sub_metering_3)),col="blue",type = "l")
 ## add legend
  legend("topright",col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),lwd=c(2.5,2.5),cex=0.75,y.intersp=0.3)
  
  ##plot 4th graph
  plot(feb12data$newdate,as.numeric(as.character(feb12data$Global_reactive_power)),type = "l",xlab="datetime",ylab="Global_reactive_power")
  
  ## copy plot to png file
  dev.copy(png,file="plot4.png",width=480, height=480)
  dev.off()
  
}