wine.dat = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv", head=T, sep = ';')  
Quality <- wine.dat[["quality"]]
Quality_Range <- ifelse(Quality %in% c(6,7,8),1,0)
wine.mod = glm(Quality_Range~alcohol + sulphates, family = binomial, data = wine.dat)
summary(wine.mod)
confint.default(wine.mod)
exp(confint.default(wine.mod))
pihat = wine.mod$fitted.values
devresids = residuals(wine.mod)
resids = residuals(wine.mod, type = "response")
Presids = residuals(wine.mod, type = "pearson")
plot(pihat, Presids, xlab = "Predicted probability", ylab = "Pearson residual")

h = hatvalues(wine.mod)
plot(pihat, h, xlab = "Predicted probability", ylab = "Leverage")
delBeta = Presids^2 * h / ((1-h)^2)
plot(pihat, delBeta, xlab = "Predicted probability", ylab = "Cook's Distance")

install.packages("ResourceSelection")
library(ResourceSelection)
hl = hoslem.test(wine.mod$y, fitted(wine.mod), g=10)
hl