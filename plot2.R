source("loadData.R")

png(filename="plot2.png", width=504, height=504, units="px", bg="white")

# !! plot() with lty="l" will draw line instead of scatter plot
# !! can only plot as.POSIXct(), as.Date loses time of the day data
with(df, plot(Global_active_power ~ as.POSIXct(date_time), type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()