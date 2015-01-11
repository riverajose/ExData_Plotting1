#read full data set in
fulldata <- read.csv("household_power_consumption.txt",sep = ";")

#subset data for only the 2 dates needed
data <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")

#create a datetime object to plot x axix
date = data[,1]
time = data[,2]

datetime <- strptime(paste(date,time),format ="%d/%m/%Y %H:%M:%S")

#adjust width for legend cutting off
par(mar=c(4,4,2,2))

#plot graph
plot(datetime,as.numeric(as.character(data$Sub_metering_1)), col = "black",type = "l", ylab = "Energy sub metering",xlab ="")
lines(datetime,as.numeric(as.character(data$Sub_metering_2)), type = "l", col = "red")
lines(datetime,as.numeric(as.character(data$Sub_metering_3)), type = "l", col = "blue")

#add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty = 1,col = c("black","red","blue"))

#output graph
dev.copy(png,"plot3.png")
dev.off()