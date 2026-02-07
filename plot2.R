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

png("plot2.png", width = 480, height = 480)

plot(subset_data$DateTime,
     subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()


