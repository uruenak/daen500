wine.dat = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv", head=T, sep = ';')  
Quality <- wine.dat[["quality"]]
fixed_acidity <- wine.dat[[1]]
citric_acid <- wine.dat[[3]]
density <- wine.dat[["density"]]
ph <- wine.dat[["pH"]]
alcohol <- wine.dat[["alcohol"]]
sulphates <- wine.dat[["sulphates"]]
model.wine <- lm(Quality ~ fixed_acidity + citric_acid + density + ph + alcohol + sulphates)
summary(model.wine)
model.wine2 <- lm(Quality ~ fixed_acidity + density + alcohol + sulphates)
summary(model.wine2)
anova(model.wine2, model.wine)
confint(model.wine2, level=0.95)
plot(alcohol, residuals(model.wine2), ylab="Residuals")
plot(sulphates, residuals(model.wine2), ylab="Residuals")
plot(density, residuals(model.wine2), ylab="Residuals")
plot(fixed_acidity, residuals(model.wine2), ylab="Residuals")
plot(fitted(model.wine2), residuals(model.wine2), ylab="Residuals", xlab="Fitted values")
qqnorm(residuals(model.wine2))
qqline(residuals(model.wine2))