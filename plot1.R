source("loaddata.R")

# Drawing on the fixed size PNG directly makes the size of the legend beautiful.
# If we draw it on the screen device and then dev.copy(png,...), the legend will be ugly.
# The example images in "figure" directory are 504 * 504. I choose 500 * 500 to make
# a slight difference.
png("plot1.png", width = 500, height = 500)

hist(df$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
