
download_data <- function() {
  if (file.exists("./household_power_consumption.txt")) {
    return()
  }
  
  DATASET_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  if (!file.exists("./dataset.zip")) {
    download.file(DATASET_URL, "dataset.zip", mode="w")
  }
  
  unzip("./dataset.zip", overwrite = TRUE)
}

read_data <- function() {
  
  download_data()
  
  if (!dir.exists("./results")) {
    dir.create("./results")
  }
  
  # As we are only interested in data for 1st and 2nd of February 2007, we'll skip first 66636 lines 
  # and read up to line 69517, which gives us 2880 lines to read.
  hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
  
  # As we were not able to read column names due to skipping lines, let's read just 1 row from the same file 
  # and set colnames of our data set so that we don't need to hardcode.
  colnames(hpc) <- colnames(read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
  
  # Let's format date and time column values
  # We don't really need separate date and time colums for our task, so let's simplify 
  # things and combine those two columns to a singlet POSIXct column named "DateTime
  hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

  return(hpc)
}
