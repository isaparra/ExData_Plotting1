datos<-read.table("household_power_consumption.txt", header=T, sep=";" )
colnames(datos) <- tolower( colnames(datos) )
data2<-datos

cols = 3:9    
data2[,cols] = apply(data2[,cols], 2, function(x) as.numeric(as.character(x)))

library(lubridate)
data2[,1]<-dmy(data2[,1])
subdata <- subset(data2, date>=ymd('2007-02-01') & date<=ymd('2007-02-02'))

png(filename ="plot2.png", width = 480, height = 480)

y<-subdata$global_active_power

plot(y, ylab="Global Active Power (kilowatts)", xlab="",type="l", 
     ylim=c(0,1.01*max(y)), xlim=c(0,2880), xaxt = "n")

axis(side=1,  at=c(1,1440,2880), 
     labels=c("Thu","Fri","Sat")
     )

dev.off()

