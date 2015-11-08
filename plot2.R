setwd("C:/Users/e43581/Desktop/Data Scientist Course/Class 4 - Exploratory Data Analysis/ExData_Plotting1") ## set working directory to where data is saved
hpc <- "./household_power_consumption.txt" ## create a variable that stores the file name
fi <- file(hpc) ## create a variable that opens file connection
library(sqldf) ## enable use of the sqldf package
df <- sqldf("select * from fi where Date = '1/2/2007' or Date = '2/2/2007'", file.format = list(header = TRUE, sep = ";")) ## create a data frame variable to store a subset of the data using the sqldf package
close(fi) ## close the file connection
library(lubridate) ## enable use of the lubridate package
df$Time <- dmy_hms(paste(df$Date, df$Time)) ## convert the Time column from text to Date including the date from the Date column otherwise it will have today's date
## Time must be converted first while Date is still in the correct format in order to use the lubridate function
df$Date <- dmy(df$Date) ## convert the Date column from text to Date
png(filename = "plot2.png")  ##  Open PNG device and create plot file 
plot(df$Time, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA) ## create the plot specifying that the type should be line and remove x-axis label 
dev.off()  ## close the PNG device