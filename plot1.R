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
hist(df$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
