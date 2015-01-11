#read full data set in
fulldata <- read.csv("household_power_consumption.txt",sep = ";")

#subset data for only the 2 dates needed
data <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")

#create a datetime object to plot x axix
date = data[,1]
time = data[,2]

datetime <- strptime(paste(date,time),format ="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

#Graph 1

plot(datetime,as.numeric(data$Global_active_power)/1000,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab = "")

#Graph 2

plot(datetime,as.numeric(data$Voltage),type = "l",
     ylab = "Voltage",xlab = "datetime")

#Graph 3
plot(datetime,as.numeric(as.character(data$Sub_metering_1)), col = "black",type = "l", ylab = "Energy sub metering",xlab ="")
lines(datetime,as.numeric(as.character(data$Sub_metering_2)), type = "l", col = "red")
lines(datetime,as.numeric(as.character(data$Sub_metering_3)), type = "l", col = "blue")

#add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black","red","blue"),cex = .5,bty = "n")

#Graph 4

plot(datetime,as.numeric(data$Global_reactive_power),type = "l",
     ylab = "Global_reactive_power",xlab = "datetime")

#output graph
dev.copy(png,"plot4.png")
dev.off()