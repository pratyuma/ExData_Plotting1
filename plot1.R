
## link to the data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
createplot1 <- function() {

## read the file  
reqdata <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, nrows = 70000)
reqdata$Date <- as.Date(reqdata$Date, "%d/%m/%Y")

## read Feb data
febdata<-subset(reqdata,format.Date(Date,"%m")=="02" & format.Date(Date,"%Y")=="2007")

## Read Feb 1 and Feb 2 data
feb12data <- subset(febdata, (format.Date(Date,"%d")=="01") | (format.Date(Date,"%d")=="02"))

## set the margins
par(mar=c(6,6,4,4))

## histogram
hist(as.numeric(as.character(feb12data$Global_active_power)),col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")

##copy plot to png file
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()

}