#read full data set in
fulldata <- read.csv("household_power_consumption.txt",sep = ";")

#subset data for only the 2 dates needed
data <- subset(fulldata, Date == "1/2/2007" | Date == "2/2/2007")

#plot histogram, first convert global_active_power to numeric

hist(as.numeric(data$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#output graph
dev.copy(png,"plot1.png")
dev.off()