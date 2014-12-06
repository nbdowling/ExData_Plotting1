# This file assumes that the data file is in the working directory set below.

setwd("~/SpiderOak Hive/Exploratory Data Analysis/Project 1/")

# Read in the whole file. (Assumes there is enough RAM.)
# Assumes the file was previously downloaded and unzipped to the working
# directory. Parameters are set based on previous examination of the data, and
# from problem statement. Note that "as.is" is used to prevent Date & Time from
# being converted to factors.
ElecPwrConsump <- read.table("household_power_consumption.txt", 
                             header = TRUE, sep = ";", na.strings = "?",
                             as.is = c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE))

# extract the data we want for the problem
Feb1Data <- ElecPwrConsump[ElecPwrConsump$Date == "1/2/2007", ]
Feb2Data <- ElecPwrConsump[ElecPwrConsump$Date == "2/2/2007", ]
# rm(ElecPwrConsump)  # uncomment to save some memory
# combine two days of data into one data frame
OurData <- rbind(Feb1Data, Feb2Data)

png(file = "plot1.png")

with(OurData, hist(Global_active_power, 
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)",
                   col = "firebrick2"))

dev.off()
