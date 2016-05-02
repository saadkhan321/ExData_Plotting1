## Clearing the Environment

rm(list=ls())


## Setting the workign directory

setwd("C:/Users/Saad_Khan/Documents/ExData_Plotting1/")

getwd()


## reading in the data

mydata <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                     na.strings = "?")


## manipulating date and time

mydata$Time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")


## storing subset of data for plotting

mydata2 <- subset(mydata, Date %in% as.Date(c("2007-02-01", "2007-02-02"),
                                            "%Y-%m-%d"))


## changing Global Active Power from factor to numeric for plotting

# mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))

## changing Sub Metering from factor to numeric for plotting

mydata2$Sub_metering_1 <- as.numeric(mydata2$Sub_metering_1)

mydata2$Sub_metering_2 <- as.numeric(mydata2$Sub_metering_2)

mydata2$Sub_metering_3 <- as.numeric(mydata2$Sub_metering_3)


## checking if conversion is successful

# is.numeric(mydata2$Global_active_power)

# is.numeric(mydata2$Sub_metering_1)

# is.numeric(mydata2$Sub_metering_2)

# is.numeric(mydata2$Sub_metering_3)

# summary(mydata2$Sub_metering_3)


## Creating png file for plot

png("plot3.png", width = 480, height = 480, bg = "transparent")




## actual code for the plot
  
plot(mydata2$Time, mydata2$Sub_metering_1, type = "l",
     col = "black", xlab = "", ylab = "Energy sub metering")

#axis(2, at = seq(0, 30, by = 10))

lines(mydata2$Time, mydata2$Sub_metering_2, type="l", col="red")

lines(mydata2$Time, mydata2$Sub_metering_3, type="l", col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
                            "Sub_metering_3"), lty = 1, lwd=2.5,
       col=c("black", "red", "blue"))
dev.off()















































