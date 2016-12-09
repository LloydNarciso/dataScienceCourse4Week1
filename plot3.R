## plot3.R creates a line graph with 3 series - one for each submeter - vs datetime
## L. Narciso - 12/09/2016

## Read in and format data
dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
dataset$Date <-strptime(paste(as.Date(dataset$Date,format="%d/%m/%Y"),dataset$Time),format ="%Y-%m-%d %H:%M:%S")
dataset<-subset(dataset,subset= (as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02"), select=-Time)
names(dataset)[names(dataset)=="Date"]<-"Date/Time"

## Output to png file
png("plot3.png")

## Create line graph
plot(dataset$Date,dataset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dataset$Date,dataset$Sub_metering_1,type="l",col="black")
lines(dataset$Date,dataset$Sub_metering_2,type="l",col="red")
lines(dataset$Date,dataset$Sub_metering_3,type="l",col="blue")

## Create legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)

dev.off()
