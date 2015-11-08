setwd("C:/Users/e43581/Desktop/Data Scientist Course/Class 4 - Exploratory Data Analysis") ## set working directory to where data is saved
hpc <- "./household_power_consumption.txt" ## create a variable that stores the file name
fi <- file(hpc) ## create a variable that opens file connection
library(sqldf) ## enable use of the sqldf package
df <- sqldf("select * from fi where Date = '1/2/2007' or Date = '2/2/2007'", file.format = list(header = TRUE, sep = ";")) ## create a data frame variable to store a subset of the data using the sqldf package
close(fi) ## close the file connection
library(lubridate) ## enable use of the lubridate package
df$Time <- dmy_hms(paste(df$Date, df$Time)) ## convert the Time column from text to Date including the date from the Date column otherwise it will have today's date
## Time must be converted first while Date is still in the correct format in order to use the lubridate function
df$Date <- dmy(df$Date) ## convert the Date column from text to Date
png(filename = "plot3.png")  ##  Open PNG device and create plot file 
plot(df$Time, df$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering") ## create the plot specifying that the type should be line, remove x-axis label and change the default of the y-axis label
lines(df$Time, df$Sub_metering_2, col="red") ## add red lines for sub metering 2
lines(df$Time, df$Sub_metering_3, col="blue") ## add blue lines for sub metering 3
legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ## add a legend
dev.off()  ## close the PNG device