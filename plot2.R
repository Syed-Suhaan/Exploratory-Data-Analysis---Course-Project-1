rm(list = ls())

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                           format = "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)

subset_data <- subset(data,
                      DateTime >= "2007-02-01" &
                      DateTime < "2007-02-03")

png("plot2.png", width = 480, height = 480)

plot(subset_data$DateTime,
     subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
