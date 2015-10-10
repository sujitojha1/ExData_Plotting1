# CODE TO PLOT : FOUR CHARTS IN SINGLE CANVAS
# Assignment Code

# Reading the data, household_power_consumption.txt
household_pwr_consum <- read.csv("household_power_consumption.txt",sep = ";",colClasses=c("character","character", rep("numeric",7)),na.strings = "?")

# Converting date and time column to combined date/time class
household_pwr_consum[["Time"]] <- paste(household_pwr_consum[["Date"]],household_pwr_consum[["Time"]])
household_pwr_consum[["Time"]] <- strptime(household_pwr_consum[["Time"]], "%d/%m/%Y %H:%M:%S")
colnames(household_pwr_consum)[2] <- "Date/Time"

#Subsetting the data to study data
date_limit_upper <- strptime("03/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
date_limit_lower <- strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
good_cases <- c(household_pwr_consum[["Date/Time"]] >= date_limit_lower & household_pwr_consum[["Date/Time"]] < date_limit_upper)
household_pwr_consum_study <- household_pwr_consum[good_cases,]

#Creating png device to store the image
png(filename = "plot4.png", width=480, height=480)

#Creating canvas with 2x2 charts
par(mfrow=c(2,2))

#First Plot
plot(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Global_active_power"]],type="l",ylab="Global Active Power (Kilowatts)", xlab="")

#Second Plot
plot(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Voltage"]],type="l",ylab="Voltage", xlab="datetime")

#Third Plot
plot(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_1"]],type="n",xlab="",ylab="Energy sub metering")
lines(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_1"]],type="l",col="BLACK")
lines(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_2"]],type="l",col="RED")
lines(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_3"]],type="l",col="BLUE")
legend("topright",legend=colnames(household_pwr_consum_study)[7:9],lty=c(1,1),col=c("BLACK","RED","BLUE"))

#Fourth Plot
plot(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Global_reactive_power"]],type="l",ylab="Global reactive power", xlab="datetime")

#Closing the png device
dev.off()

#Clearing the workspace
rm(list = ls())