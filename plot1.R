## plot1.R creates a histogram of global active power
## L. Narciso - 12/09/2016

## Read in and format data
dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
dataset$Date <-strptime(paste(as.Date(dataset$Date,format="%d/%m/%Y"),dataset$Time),format ="%Y-%m-%d %H:%M:%S")
dataset<-subset(dataset,subset= (as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02"), select=-Time)
names(dataset)[names(dataset)=="Date"]<-"Date/Time"

## Output to png file
png("plot1.png")

## Create histogram
hist(dataset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
