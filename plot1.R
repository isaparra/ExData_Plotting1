datos<-read.table("household_power_consumption.txt", header=T, sep=";" )
colnames(datos) <- tolower( colnames(datos) )
data2<-datos

cols = 3:9    
data2[,cols] = apply(data2[,cols], 2, function(x) as.numeric(as.character(x)))

library(lubridate)

data2[,1]<-dmy(data2[,1])

subdata <- subset(data2, date>=ymd('2007-02-01') & date<=ymd('2007-02-02'))

png(filename ="plot1.png", width = 480, height = 480)

hist(subdata$global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()
