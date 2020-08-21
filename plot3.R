source("utils.R")

hpc <- read_data()

png("results/plot3.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")

title(ylab = "Energy sub metering")

legend("topright", lty=1,
       legend=c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"),
       col=c("black", "red", "blue"))

dev.off()