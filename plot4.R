# The fourth Plot
# read the file
household_power_consumption <- read.csv("/media/fred/Donnees/Donnees/Coursera/Exploratory Data Analysis/Devoirs/Week1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

head(household_power_consumption)
# Change the loocale for the Date/Time because as.Date() return  NA with my lcale (see .as.Date)
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
# Convert to Date class the column  Date
as.Date(household_power_consumption$Date, format="%d/%m/%Y")->HouseDate
household_power_consumption$Date<-HouseDate
# Extract the datas just for the two firs days in february 2007
subset(household_power_consumption,HouseDate =="2007-02-01" | HouseDate =="2007-02-02" ) -> dftest
DateTime<-strptime(paste(dftest$Date,dftest$Time),"%Y-%m-%d %T")
# Add a new column in the working subset
dftest<-cbind(DateTime,dftest)

# open the device png
png(filename = "Plot4.png")
# specifie 4 figures  in a plot, 2x2, by column
par(mfcol=c(2,2))

# first plot
plot(dftest$DateTime,as.numeric(dftest$Global_active_power),type = "l",xlab="",ylab= "Global Active Power (Kilowatts)")
# second plot with multiples lines and a legend
plot(dftest$DateTime,as.numeric(dftest$Sub_metering_1),type = "l",xlab="",ylab= "Energy sub metering")
lines(dftest$DateTime,as.numeric(dftest$Sub_metering_2),col = "red")
lines(dftest$DateTime,as.numeric(dftest$Sub_metering_3),col = "blue")
legend("topright",legend = names(dftest)[8:10],col=c(1,2,4),lty=1 )
# third plot
plot(dftest$DateTime,as.numeric(dftest$Voltage),type = "l",xlab="datetime",ylab= "Voltage")
# fourth plot
plot(dftest$DateTime,as.numeric(dftest$Global_reactive_power),type = "l",xlab="datetime",ylab= "Global_reactive_power")
# don't forget tto close the device
dev.off()
