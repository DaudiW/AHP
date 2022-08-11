xrm(list=ls())
graphics.off()

AHPdata <- read.csv("~/RData/AHP/PrecessionVShumidity.csv", header = TRUE)

outlier_values <- boxplot.stats(AHPdata$Humidity_3kyr_AVG_DIFF)$out
boxplot(AHPdata$Humidity_3kyr_AVG_DIFF, main="3kyr western Africa humidity index", boxwex=0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)

boxplot(Humidity_3kyr_AVG_DIFF ~ Prec_3KYR_AVG_DIFF, data=AHPdata, main="Boxplot for Precession vs Humidity Index")

mod <- lm(Humidity_3kyr_AVG_DIFF ~ ., data=AHPdata)
cooksd <- cooks.distance(mod)

plot(cooksd, pch="*", cex=2, main="Influential observations by Cooks Distance")  # plot cook's distance

abline(h = 15*mean(cooksd, na.rm=T), col="red")
text(x=1:length(cooksd)+1, y=cooksd, labels=ifelse(cooksd>15*mean(cooksd, na.rm=T),AHPdata$kyBP,""), col="green")  # label cook's distance
text(x=1:length(cooksd)+1, y=cooksd, labels=ifelse(AHPdata$kyBP==5,""), col="green")  # label 8-5ka only
text(x=1:length(cooksd)+1, y=cooksd, labels=ifelse(AHPdata$kyBP==5.5,""), col="blue")  # label 8.5-5.5ka only

fourka <- subset(AHPdata$kyBP == 5, AHPdata$kyBP == 5.5)
text(cooksd, fourka, col="red")

influential <- as.numeric(names(cooksd)[(cooksd > 15*mean(cooksd, na.rm=T))])
head(AHPdata[influential, ])



