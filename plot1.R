
household_power_consumption <- read.csv("/media/fred/Donnees/Donnees/Coursera/Exploratory Data Analysis/Devoirs/Week1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

head(household_power_consumption)
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
as.Date(household_power_consumption$Date, format="%d/%m/%Y")->HouseDate
household_power_consumption$Date<-HouseDate
subset(household_power_consumption,HouseDate =="2007-02-01" | HouseDate =="2007-02-02" ) -> dftest
png(filename = "Plot1.png")
hist(as.numeric(dftest$Global_active_power),col = "red",main = "Global Active Power",xlab= "Global Active Power (Kilowatts)")
dev.off()




