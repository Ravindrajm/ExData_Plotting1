data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

subset_data <- subset(data,
                      Date == "2007-02-01" | Date == "2007-02-02")

subset_data$DateTime <- strptime(
  paste(subset_data$Date, subset_data$Time),
  "%Y-%m-%d %H:%M:%S"
)

png("plot3.png", width = 480, height = 480)

plot(subset_data$DateTime,
     subset_data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")

legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

dev.off()
