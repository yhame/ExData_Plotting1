

D <- read.csv("../household_power_consumption.txt",sep=";",header = TRUE)
D[,1] <- as.Date(D[,1],format = "%d/%m/%Y")
#dates <- paste(D[1,1],toString(D[1,2]))

rows <- which(D[,1] == "2007-02-01")
rows <- c(rows,which(D[,1] == "2007-02-02"))

D <- D[rows,]

nValues <- length(rows)

png(filename="./plot3.png")

plot(as.numeric(as.character(D$Sub_metering_1)),
     xlab = "", ylab="Energy sub metering", type = "l",xaxt='n')
axis(side = 1,at = c(1,(nValues/2)+1,nValues),labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(as.character(D$Sub_metering_2)), col = "red")
lines(as.numeric(as.character(D$Sub_metering_3)), col = "blue")
legend("topright",legend = names(D)[7:9], 
       col=c("black","red","blue"),
       lwd = 1)

dev.off()
