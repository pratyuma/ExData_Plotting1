createplot3 <- function() {
  
  reqdata <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, nrows = 70000)
  library(lubridate)
  reqdata$Date <- dmy(reqdata$Date)
  
  ## subset feb 1 and 2 data
  febdata<-subset(reqdata,format.Date(Date,"%m")=="02" & format.Date(Date,"%Y")=="2007")
  feb12data <- subset(febdata, (format.Date(Date,"%d")=="01") | (format.Date(Date,"%d")=="02"))
  
  ## Combine date and time columns
  feb12data$newdate <- with(feb12data,ymd_hms(paste(Date,Time)))
  par(mar=c(4,6,4,4))
  
  ## plot the graph, add graphs in the same function using lines function
  plot(feb12data$newdate,as.numeric(as.character(feb12data$Sub_metering_1)),col="black",type = "l",xlab="",ylab="Energy sub metering")
  lines(feb12data$newdate,as.numeric(as.character(feb12data$Sub_metering_2)),col="red",type = "l")
  lines(feb12data$newdate,as.numeric(as.character(feb12data$Sub_metering_3)),col="blue",type = "l")
  ## add legend
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),y.intersp=0.5,lty = c(1,1),lwd=c(2.5,2.5),cex = 0.75)
 
  ## copy plot to png file
  dev.copy(png,file="plot3.png",width=480, height=480)
  dev.off()
  
}