

D <- read.csv("../household_power_consumption.txt",sep=";",header = TRUE)
D[,1] <- as.Date(D[,1],format = "%d/%m/%Y")
#dates <- paste(D[1,1],toString(D[1,2]))

rows <- which(D[,1] == "2007-02-01")
rows <- c(rows,which(D[,1] == "2007-02-02"))

D <- D[rows,]

nValues <- length(rows)

png(filename="./plot4.png")

par(mfrow=c(2,2)) 

plot(as.numeric(as.character(D$Global_active_power)),
     xlab = "", ylab="Global Active Power (kilowatts)", type = "l",xaxt='n')
axis(side = 1,at = c(1,(nValues/2)+1,nValues),labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(as.character(D$Voltage)),
     xlab = "datetime", ylab="Voltage", type = "l",xaxt='n')
axis(side = 1,at = c(1,(nValues/2)+1,nValues),labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(as.character(D$Sub_metering_1)),
     xlab = "", ylab="Energy sub metering", type = "l",xaxt='n')
axis(side = 1,at = c(1,(nValues/2)+1,nValues),labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(as.character(D$Sub_metering_2)), col = "red")
lines(as.numeric(as.character(D$Sub_metering_3)), col = "blue")
legend("topright",legend = names(D)[7:9], 
       col=c("black","red","blue"),
       lwd = 1,bty="n")
plot(as.numeric(as.character(D$Global_reactive_power)),
     xlab = "datetime", ylab="Global_reactive_power", type = "l",xaxt='n')
axis(side = 1,at = c(1,(nValues/2)+1,nValues),labels = c("Thu", "Fri", "Sat"))


dev.off()


