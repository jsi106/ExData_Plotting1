source("loadData.R")

png(filename="plot1.png", width=504, height=504, units="px", bg="white")

# not barplot, histogram instead
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

dev.off()
