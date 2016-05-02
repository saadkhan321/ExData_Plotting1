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

mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))


## checking if conversion is successful

# is.numeric(mydata2$Global_active_power)


## Creating png file for plot

png("plot1.png", width = 480, height = 480, bg = "transparent")


## actual code for the plot
  
hist(mydata2$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
 
dev.off()
















































