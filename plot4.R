setwd('C:/users/x/desktop/exdata_data_household_power_consumption')

data <- read.table("household_power_consumption.txt" , header = T , sep = ';')
data$Date <- as.Date(data$Date , "%d/%m/%Y")

subdata <- subset(data , data$Date=="2007-02-01" | data$Date=="2007-02-02")

Sys.setlocale("LC_ALL","English")
subdata$DateTime <- strptime(paste(subdata$Date , subdata$Time) , "%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfcol = c(2,2))
# topleft graph
with(subdata , plot(DateTime , Gcp , type='l' , xlab = '' , ylab = "Global Active Power (kilowatts)"))
# bottomleft graph
with(subdata , plot(DateTime , as.numeric(as.character(Sub_metering_1)) , 
                    type = 'l' , xlab = '' , ylab = 'Energy sub metering'))
with(subdata , points(DateTime , as.numeric(as.character(Sub_metering_2)) , 
                      type = 'l' , col = 'red'))
with(subdata , points(DateTime , as.numeric(as.character(Sub_metering_3)) , 
                      type = 'l' , col = 'blue'))
legend("topright" , lty = 1 , col = c('black' , 'red' , 'blue') , 
       legend = c('Sub_metering_1' , 'Sub_metering_1' , 'Sub_metering_1'))
# topright graph
with(subdata , plot(DateTime , as.numeric(as.character(Voltage)) , 
                    type = 'l' , xlab = 'datetime' , ylab = 'Voltage'))
# bottomright graph
with(subdata , plot(DateTime , as.numeric(as.character(Global_reactive_power)) , 
                    type = 'l' , xlab = 'datetime' , ylab = 'Global_reactive_power'))
dev.off()