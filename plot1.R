# CODE TO PLOT : GLOBAL xxx

#
# Reading the data, household_power_consumption.txt
# 
household_pwr_consum <- read.csv("household_power_consumption1.txt",sep = ";",colClasses=c("character","character", rep("numeric",7)),na.strings = "?")
#household_pwr_consum[["Date"]] <- as.Date(household_pwr_consum[["Date"]],"%d/%m/%Y")

household_pwr_consum[["Time"]] <- paste(household_pwr_consum[["Date"]],household_pwr_consum[["Time"]])
household_pwr_consum[["Time"]] <- strptime(household_pwr_consum[["Time"]], "%d/%m/%Y %H:%M:%S")

colnames(household_pwr_consum)[2] <- "Date/Time"

hist(household_pwr_consum[["Global_active_power"]],main="Global Active Power", xlab="Global Active Power (Kilowatts)", col="RED")
