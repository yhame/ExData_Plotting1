plot1 <- function() {
  
  D <- read.csv("../household_power_consumption.txt",sep=";",header = TRUE)
  D[,1] <- as.Date(D[,1],format = "%d/%m/%Y")
  #dates <- paste(D[1,1],toString(D[1,2]))
  
  rows <- which(D[,1] == "2007-02-01")
  rows <- c(rows,which(D[,1] == "2007-02-02"))
  
  D <- D[rows,]
  
  png(filename="./plot1.png")
  hist(as.numeric(as.character(D$Global_active_power)), main = "Global Active Power",
       ylab = "Frequency", xlab="Global Active Power (kilowatts)", ylim = c(0,1200),
       col = "red")
  dev.off()
  
  
}
