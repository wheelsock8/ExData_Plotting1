## Keith Swaback
## Exploratory Data Assignment 1
## Jan 8 2017

## This R script loads in the Feb 1 - Feb 2 2007 data and creates the first 
## required plot as described in the assignment.

## This R script assumes that the household power consumption data is stored
## in the current working directory as a .txt file.

## As a first step, read in the data from these two dates only. To do this,
## I manually inspected the data and found the range of lines that contain 
## data from these dates. Then I read in only this data. This minimizes the
## amount of RAM required to read in the data.

## Starting line for Feb 1 2007: 66638
## Ending line for Feb 2 2007: 69517
## Total lines to read in: 69517 - 66638 + 1 = 2880 lines

powerData <- read.table("household_power_consumption.txt", sep = ";", 
                        na.strings = "?", header = TRUE, nrows = 2880, skip = 66636,
                        colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric", "numeric"))

## Assign correct names to the dataframe if R doesn't do this automatically
names(powerData) <- read.table("household_power_consumption.txt", sep = ";", 
                        header = FALSE, nrows = 1, skip = 0, colClasses = "character") 

## Convert the date and time columns to a usable time format (i.e. POSIXlt) and 
## add this as a new column in the dataset. Assume CST for timezone.

powerData$dateTime <- strptime(paste(powerData$Date, powerData$Time),
                               format = "%d/%m/%Y %H:%M:%S")

## Now we're ready to create the first required plot, which is a histogram saved as a
## .png file, with titles and colors correctly annotated.

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(powerData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
