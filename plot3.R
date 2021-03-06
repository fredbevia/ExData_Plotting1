household_power_consumption <- read.csv("/media/fred/Donnees/Donnees/Coursera/Exploratory Data Analysis/Devoirs/Week1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

head(household_power_consumption)
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
as.Date(household_power_consumption$Date, format="%d/%m/%Y")->HouseDate
household_power_consumption$Date<-HouseDate
subset(household_power_consumption,HouseDate =="2007-02-01" | HouseDate =="2007-02-02" ) -> dftest
DateTime<-strptime(paste(dftest$Date,dftest$Time),"%Y-%m-%d %T")
dftest<-cbind(DateTime,dftest)


png(filename = "Plot3.png")
plot(dftest$DateTime,as.numeric(dftest$Sub_metering_1),type = "l",xlab="",ylab= "Energy sub metering")
lines(dftest$DateTime,as.numeric(dftest$Sub_metering_2),col = "red")
lines(dftest$DateTime,as.numeric(dftest$Sub_metering_3),col = "blue")
legend("topright",legend = names(dftest)[8:10],col=c(1,2,4),lty=1 )

dev.off()
