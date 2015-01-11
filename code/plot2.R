#read full data set in
fulldata <- read.csv("household_power_consumption.txt",sep = ";")

#subset data for only the 2 dates needed
data <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")

#create a datetime object to plot x axix
date = data[,1]
time = data[,2]

datetime <- strptime(paste(date,time),format ="%d/%m/%Y %H:%M:%S")


#create graph 
plot(datetime,as.numeric(data$Global_active_power)/1000,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab = "")


#output graph
dev.copy(png,"plot2.png")
dev.off()