datos<-read.table("household_power_consumption.txt", header=T, sep=";" )
colnames(datos) <- tolower( colnames(datos) )
data2<-datos

cols = 3:9    
data2[,cols] = apply(data2[,cols], 2, function(x) as.numeric(as.character(x)))

library(lubridate)
data2[,1]<-dmy(data2[,1])
subdata <- subset(data2, date>=ymd('2007-02-01') & date<=ymd('2007-02-02'))


png(filename ="plot3.png", width = 480, height = 480)

y1<-subdata$sub_metering_1
y2<-subdata$sub_metering_2
y3<-subdata$sub_metering_3

plot(y, ylab="Energy sub metering", xlab="",type="n", 
     ylim=c(0,1.01*max(y1)),xlim=c(0,2880),
     xaxt="n")

lines(y1)
lines(y2,col="red")
lines(y3,col="blue")

axis( side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat") )

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=c(1,1)
       )

dev.off()
