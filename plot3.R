source("loadData.R")

png(filename="plot3.png", width=504, height=504, units="px", bg="white")

# 3 contents in a plot, but using points() instead of plot
with(df, plot(Sub_metering_1 ~ as.POSIXct(date_time), type="l", col="black", ylab="Energy sub metering", xlab=""))
with(df, points(Sub_metering_2 ~ as.POSIXct(date_time), type="l", col="red", ylab="", xlab=""))
with(df, points(Sub_metering_3 ~ as.POSIXct(date_time), type="l", col="blue", ylab="", xlab=""))

# add legend, use lty instead of pch
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()