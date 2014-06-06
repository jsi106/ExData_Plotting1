
# date range to keep
s_date <- as.Date("2007/02/01")
e_date <- as.Date("2007/02/02")
src_file <- "household_power_consumption.txt"
tidy_file <- "tidy.csv"

# tidy.csv contains only data for 01/02/2007 and 02/02/2007 (Jan.2 - Feb.2)
if (!file.exists(tidy_file)) {
  # download the source file for project
  if (!file.exists(src_file)) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpc.zip", method="curl")
    unzip("hpc.zip")
  }
  
  # cannot use csv2! csv2 uses ";" as sep, and "," as decimal
  src_df <- read.csv(src_file, na.string="?", sep=";",
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))  
  
  # create a new date_time column of "POSIXlt" "POSIXt"
  # http://rfunction.com/archives/1912
  src_df$date_time <- strptime(paste(src_df$Date, src_df$Time), format="%d/%m/%Y %H:%M:%S")

  # retain only the data in the date range
  # !! as.Date() so we can perform comparison
  #tdf <- src_df[as.Date(src_df$date_time) >= s_date & as.Date(src_df$date_time) < e_date,]
  tdf <- src_df[as.Date(src_df$date_time) %in% c(s_date,e_date),]

  # !! row.names = don't write out row names, in this case, line number
  write.csv(tdf, file=tidy_file, row.names=FALSE)
}

df <- read.csv(tidy_file, 
               colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric","character"))
# !! convert character back to strptime
df$date_time <- strptime(df$date_time, format="%Y-%m-%d %H:%M:%S")
