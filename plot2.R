

D <- read.csv("../household_power_consumption.txt",sep=";",header = TRUE)
D[,1] <- as.Date(D[,1],format = "%d/%m/%Y")
#dates <- paste(D[1,1],toString(D[1,2]))

rows <- which(D[,1] == "2007-02-01")
rows <- c(rows,which(D[,1] == "2007-02-02"))

D <- D[rows,]

nValues <- length(rows)

png(filename="./plot2.png")
plot(as.numeric(as.character(D$Global_active_power)),
     xlab = "", ylab="Global Active Power (kilowatts)", type = "l",xaxt='n')
axis(side = 1,at = c(1,(nValues/2)+1,nValues),labels = c("Thu", "Fri", "Sat"))
dev.off()
