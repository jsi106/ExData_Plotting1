source("loadData.R")

png(filename="plot4.png", width=504, height=504, units="px")
# 4 plots in canvas
par(mfrow=c(2,2))

with(df, plot(Global_active_power ~ as.POSIXct(date_time), type="l", 
              col="black", ylab="Global Active Power", xlab=""))

with(df, plot(Voltage ~ as.POSIXct(date_time), type="l", 
              col="black", ylab="Voltage", xlab="datetime"))

with(df, plot(Sub_metering_1 ~ as.POSIXct(date_time), type="l", col="black", ylab="Energy sub metering", xlab=""))
with(df, points(Sub_metering_2 ~ as.POSIXct(date_time), type="l", col="red", ylab="", xlab=""))
with(df, points(Sub_metering_3 ~ as.POSIXct(date_time), type="l", col="blue", ylab="", xlab=""))
# bty="n" will not draw box around the legend
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, bty="n")

with(df, plot(Global_reactive_power ~ as.POSIXct(date_time), type="l", xlab="datetime"))

dev.off()