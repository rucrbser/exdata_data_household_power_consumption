setwd('C:/users/x/desktop/exdata_data_household_power_consumption')

data <- read.table("household_power_consumption.txt" , header = T , sep = ';')
data$Date <- as.Date(data$Date , "%d/%m/%Y")

subdata <- subset(data , data$Date=="2007-02-01" | data$Date=="2007-02-02")

Gcp <- as.numeric(as.character(subdata$Global_active_power))

hist(Gcp , col = "red" , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")

dev.copy(png , "plot1.png")
dev.off()