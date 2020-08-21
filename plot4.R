source("utils.R")

hpc <- read_data()

png("results/plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(hpc$DateTime, hpc$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(hpc$DateTime, hpc$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")


plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")

title(ylab = "Energy sub metering")

legend("topright", lty=1, bty = "n",
       legend=c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"),
       col=c("black", "red", "blue"))

plot(hpc$DateTime, hpc$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")


dev.off()