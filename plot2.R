initial <- read.table("household_power_consumption.txt",nrows = 10,sep = ";",header=TRUE,na.strings="?")
classes <- sapply(initial,class)
tab <- read.table("household_power_consumption.txt",nrows = 2075300,sep = ";",header=TRUE,colClasses = classes,na.strings="?")
cond1 <- (tab$Date == "1/2/2007")
cond2 <- (tab$Date == "2/2/2007")
power <- tab$Global_active_power
p1 <- power[cond1]
p2 <- power[cond2]
p <- c(p1,p2)
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
plot(dttmf,p, type ="l",xlab = "",ylab = "Global Active Power (kilowatts)",xaxt="n")
xat <- c(dttmf[1],dttmf[l/2+1],dttmf3[1]) 
xlb <- c(dttma[1],dttma[l/2+1],dttma3[1]) 
axis(1,xat,xlb)
dev.copy(png,file = "plot2.png") # copy my plot to a png file
dev.off() #close the png device

