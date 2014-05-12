initial <- read.table("household_power_consumption.txt",nrows = 10,sep = ";",header=TRUE,na.strings="?")
classes <- sapply(initial,class)
tab <- read.table("household_power_consumption.txt",nrows = 2075300,sep = ";",header=TRUE,colClasses = classes,na.strings="?")
cond1 <- (tab$Date == "1/2/2007")
cond2 <- (tab$Date == "2/2/2007")

sub1 <- tab$Sub_metering_1
sub2 <- tab$Sub_metering_2
sub3 <- tab$Sub_metering_3
sm11 <- sub1[cond1]
sm12 <- sub1[cond2]
sm1 <- c(sm11,sm12)
sm21 <- sub2[cond1]
sm22 <- sub2[cond2]
sm2 <- c(sm21,sm22)
sm31 <- sub3[cond1]
sm32 <- sub3[cond2]
sm3 <- c(sm31,sm32)

dt <- tab$Date
tm <- tab$Time
dt1 <- dt[cond1]
dt2 <- dt[cond2]
tm1 <- tm[cond1]
tm2 <- tm[cond2]
dttm1 <- paste(dt1,tm1)
dttm2 <- paste(dt2,tm2)
dttm <- c(dttm1,dttm2)
dttms <- strptime(dttm, "%d/%m/%Y %H:%M:%S", tz="")
dttmf <- strftime(dttms, "%s")
dttma <- strftime(dttms, "%a")
cond3 <- (tab$Date == "3/2/2007")
dt3 <- dt[cond3]
tm3 <- tm[cond3]
dttm3 <- paste(dt3,tm3)
dttms3 <- strptime(dttm3, "%d/%m/%Y %H:%M:%S", tz="")
dttmf3 <- strftime(dttms3, "%s")
dttma3 <- strftime(dttms3, "%a")
library(datasets)
png("plot3.png")
plot(dttmf,sm1, type ="l",xlab = "",ylab = "Energy sub metering",xaxt="n")
lines(dttmf,sm2, type ="l",col="red")
lines(dttmf,sm3, type ="l",col="blue")
colnm <- names(tab)
lgd <- colnm[7:9]
legend('topright', lgd, lty=1, col=c('black','red', 'blue'),bty='o',cex=.75)
l = length(dttmf)
xat <- c(dttmf[1],dttmf[l/2+1],dttmf3[1]) 
xlb <- c(dttma[1],dttma[l/2+1],dttma3[1]) 
axis(1,xat,xlb)
dev.off() #close the png device

