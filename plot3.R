# CODE TO PLOT : THREE LINE SERIES IN SINGLE PLOT W/ LEGENDS

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

#Opening png device for plotting
png(filename = "plot3.png", width=480, height=480)

#Plotting line series 
plot(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_1"]],type="n",xlab="",ylab="Energy sub metering")
lines(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_1"]],type="l",col="BLACK")
lines(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_2"]],type="l",col="RED")
lines(household_pwr_consum_study[["Date/Time"]],household_pwr_consum_study[["Sub_metering_3"]],type="l",col="BLUE")

#Setting the legends
legend("topright",legend=colnames(household_pwr_consum_study)[7:9],lty=c(1,1),col=c("BLACK","RED","BLUE"))

#Closing the png device
dev.off()

#Clearing the workspace
rm(list = ls())