initial <- read.table("household_power_consumption.txt",nrows = 10,sep = ";",header=TRUE,na.strings="?")
classes <- sapply(initial,class)
tab <- read.table("household_power_consumption.txt",nrows = 2075300,sep = ";",header=TRUE,colClasses = classes,na.strings="?")
cond1 <- (tab$Date == "1/2/2007")
cond2 <- (tab$Date == "2/2/2007")
power <- tab$Global_active_power
p1 <- power[cond1]
p2 <- power[cond2]
p <- c(p1,p2)
library(datasets)
 hist(p, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png") # copy my plot to a png file
dev.off() #close the png device