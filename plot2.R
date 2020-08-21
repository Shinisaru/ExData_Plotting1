source("utils.R")

hpc <- read_data()

png("results/plot2.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Global_active_power, type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()