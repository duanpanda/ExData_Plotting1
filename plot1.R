df <- read.csv("./household_power_consumption.txt",
               nrows = 2880, skip = 68076, # only read lines for 2-Feb-2007 and 3-Feb-2007
               sep = ";",
               col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                             "Voltage", "Global_intensity", "Sub_metering_1",
                             "Sub_metering_2", "Sub_metering_3"),
               na.strings = "?",
               as.is = c(1, 2)) # do not convert first and second column to Factors
t <- paste(df$Date, df$Time) # default sep = " "
s <- strptime(t, "%d/%m/%Y %H:%M:%S")
df$Time <- s
