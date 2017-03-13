source("loaddata.R")

# Drawing on the fixed size PNG directly makes the size of the legend beautiful.
# If we draw it on the screen device and then dev.copy(png,...), the legend will be ugly.
# The example images in "figure" directory are 504 * 504. I choose 500 * 500 to make
# a slight difference.
png("plot4.png", width = 500, height = 500)

par(mfrow = c(2, 2))
# plot 1
plot(df$Time, df$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# plot 2
plot(df$Time, df$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# plot 3
plot(df$Time, df$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "", col = "black")
points(df$Time, df$Sub_metering_2, type = "l", col = "red")
points(df$Time, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
       lty = c("solid", "solid", "solid"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# plot 4
plot(df$Time, df$Global_reactive_power, type = "l",
     ylab = "Global_rective_power", xlab = "datetime")

dev.off()
