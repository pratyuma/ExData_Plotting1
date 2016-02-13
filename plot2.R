createplot2 <- function() {
  ##Read the file
  reqdata <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, nrows = 70000)
  library(lubridate)
  reqdata$Date <- dmy(reqdata$Date)
  
  ## subset Feb 1 and 2 data
  febdata<-subset(reqdata,format.Date(Date,"%m")=="02" & format.Date(Date,"%Y")=="2007")
  feb12data <- subset(febdata, (format.Date(Date,"%d")=="01") | (format.Date(Date,"%d")=="02"))
  
  ## Combine Date and Time columns
  feb12data$newdate <- with(feb12data,ymd_hms(paste(Date,Time)))
  par(mar=c(4,6,4,4))
  
  ##Plot newdate vs global active power
  plot(feb12data$newdate,as.numeric(as.character(feb12data$Global_active_power)),type = "l",xlab="",ylab = "Global Active Power(kilowatts)")
  
  ## copy plot to png
  dev.copy(png,file="plot2.png",width=480, height=480)
  dev.off()
  
}