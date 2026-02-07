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

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1
plot(subset_data$DateTime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Plot 2
plot(subset_data$DateTime, subset_data$Voltage,
     type = "l",
     xlab = "DateTime",
     ylab = "Voltage")

# Plot 3
plot(subset_data$DateTime, subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright",
       bty = "n",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

# Plot 4
plot(subset_data$DateTime, subset_data$Global_reactive_power,
     type = "l",
     xlab = "DateTime",
     ylab = "Global Reactive Power")

dev.off()

