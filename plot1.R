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
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") ## create a histogram plot
dev.copy(png, file = "plot1.png")  ## copy plot to a PNG file
dev.off()  ## close the PNG device