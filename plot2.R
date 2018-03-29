setwd('C:/users/x/desktop/exdata_data_household_power_consumption')

data <- read.table("household_power_consumption.txt" , header = T , sep = ';')
data$Date <- as.Date(data$Date , "%d/%m/%Y")

subdata <- subset(data , data$Date=="2007-02-01" | data$Date=="2007-02-02")

Sys.setlocale("LC_ALL","English")
subdata$DateTime <- strptime(paste(subdata$Date , subdata$Time) , "%Y-%m-%d %H:%M:%S")

Gcp <- as.numeric(as.character(subdata$Global_active_power))

png("plot2.png")
plot(subdata$DateTime , Gcp , type='l' , xlab = '' , ylab = "Global Active Power (kilowatts)")
dev.off()
