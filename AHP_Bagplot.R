rm(list=ls())
graphics.off()

AHPdata <- read.csv("~/RData/AHP/PrecessionVShumidity.csv", header = TRUE)

AHPx <- AHPdata[which(AHPdata$kyBP < 6.5),]

  
bagplot(AHPdata$Humidity_3kyr_AVG_DIFF, AHPdata$Prec_3KYR_AVG_DIFF, factor = 3, na.rm = FALSE, approx.limit = 300,  
        show.outlier = TRUE, show.whiskers = TRUE, 
        show.looppoints = TRUE, show.bagpoints = TRUE,
        show.loophull = TRUE, show.baghull = TRUE, 
        create.plot = TRUE, add = FALSE, pch = 16, cex = 0.4, 
        dkmethod = 2, precision = 1, verbose = FALSE, 
        debug.plots = "no",   col.loophull="#aaccff", 
        col.looppoints="#3355ff", col.baghull="#7799ff", 
        col.bagpoints="#000088", transparency=FALSE, 
        show.center = TRUE
)
bagplot(AHPx$Humidity_3kyr_AVG_DIFF, AHPx$Prec_3KYR_AVG_DIFF, factor = 3, na.rm = FALSE, approx.limit = 300,  
        show.outlier = F, show.whiskers = F, 
        show.looppoints = F, show.bagpoints = T,
        show.loophull = F, show.baghull = F, 
        create.plot = T, add = T, pch = 21, cex = 0.5, 
        dkmethod = 2, precision = 1, verbose = FALSE, 
        debug.plots = "no", col.bagpoints="green", transparency=T, 
        show.center = F 
)

