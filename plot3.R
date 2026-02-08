rm(list = ls())

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                           format = "%d/%m/%Y %H:%M:%S")

cols <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data[cols] <- lapply(data[cols], as.numeric)

subset_data <- subset(data,
                      DateTime >= "2007-02-01" &
                      DateTime < "2007-02-03")

png("plot3.png", width = 480, height = 480)

plot(subset_data$DateTime,
     subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(subset_data$DateTime,
      subset_data$Sub_metering_2,
      col = "red")

lines(subset_data$DateTime,
      subset_data$Sub_metering_3,
      col = "blue")

legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
