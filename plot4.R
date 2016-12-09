## plot4.R creates four graphs and places them in a 2 x 2 plot
## 1) global active power vs datetime (TOPLEFT)
## 2) voltage vs datetime (TOP RIGHT)
## 3) energy sub metering (3 series) vs datetime (BOTTOM LEFT)
## 4) global reactive power vs datetime (BOTTOM RIGHT)
## L. Narciso - 12/09/2016

## Read in and format data
dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
dataset$Date <-strptime(paste(as.Date(dataset$Date,format="%d/%m/%Y"),dataset$Time),format ="%Y-%m-%d %H:%M:%S")
dataset<-subset(dataset,subset= (as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02"), select=-Time)
names(dataset)[names(dataset)=="Date"]<-"Date/Time"

## Output to png file
png("plot4.png")

## Set up 2x2 grid
par(mfrow = c(2,2))

## Create graph 1
plot(dataset$Date,dataset$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(dataset$Date,dataset$Global_active_power,type="l")

## Create graph 2
plot(dataset$Date,dataset$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(dataset$Date,dataset$Voltage,type="l")

## Create graph 3 with legend
plot(dataset$Date,dataset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dataset$Date,dataset$Sub_metering_1,type="l",col="black")
lines(dataset$Date,dataset$Sub_metering_2,type="l",col="red")
lines(dataset$Date,dataset$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)

## Create graph 4
plot(dataset$Date,dataset$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(dataset$Date,dataset$Global_reactive_power,type="l")

dev.off()
