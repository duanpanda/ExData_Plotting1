df <- read.csv("./household_power_consumption.txt",
               nrows = 69518-66637-1, skip = 66636, # only read lines for 1-Feb-2007 and 2-Feb-2007
               sep = ";",
               col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                             "Voltage", "Global_intensity", "Sub_metering_1",
                             "Sub_metering_2", "Sub_metering_3"),
               na.strings = "?",
               as.is = c(1, 2)) # do not convert first and second column to Factors
t <- paste(df$Date, df$Time) # default sep = " "
s <- strptime(t, "%d/%m/%Y %H:%M:%S")
df$Time <- s

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
rect <- legend("topright", col = c("black", "red", "blue"),
               lty = c("solid", "solid", "solid"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",
               xjust = 1, y.intersp = 0.4)

# plot 4
plot(df$Time, df$Global_reactive_power, type = "l",
     ylab = "Global_rective_power", xlab = "datetime")

dev.copy(png, file = "plot4.png")
dev.off()
