# Figure 3
# effect of selfing rate
# selfing alone
setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures")
recolonization = 1 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1

x = read.table("output_selfing.txt", h=T)
x = x[, -10]
x = x[which(x$recolonization == recolonization), ]
x = x[which(x$fecundity == fecundity), ]

x = cleanQuantiSexTable(x)

x = as.data.frame(x)

recolonization = 1
fecundity = 5000
extRate = 0

y = x[which(x$recolonization == recolonization), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$extRate == extRate), ]
y = y[which(y$migRate == 0 | y$migRate == 1 | y$migRate == 2 | y$migRate == 3 | y$migRate == 4 | y$migRate == 5 | y$migRate == 6 | y$migRate == 7 | y$migRate == 8 | y$migRate == 9 | y$migRate == 10), ] 

cnt = -0.2
dev.new(width=5, height=45)
par(mfrow = c(2, 1), las = 1, mar = c(4.75, 4, 3, 2.75))

plot(y$selfingRate, y$meanFemAlloc, xlim = c(0, 1), ylim = c(0, 1), pch = 16, col = "white", xlab = "selfing rate", ylab = "proportion female allocation", cex.lab = 1.2, cex.axis = 1.2, main = "extinction rate = 0", cex = 1.25)
abline(a=0.5, b=0.5, col="red", lwd = 1.25)
points(y$selfingRate, y$meanFemAlloc, pch = 16, col = "black", cex = 1.25)


# selfing + extRate
setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures")
recolonization = 1 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1

x = read.table("bilan.txt", h=T)

x = x[which(x$recolonization == recolonization), ]
x = x[which(x$fecundity == fecundity), ]

x = cleanQuantiSexTable(x)

x = as.data.frame(x)

# figure 2: relation between female allocation and population genetics
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]

k1 = y[which(y$recolonization == recolonization), ]
recolonization = 1
fecundity = 5000
extRate = 0.3

y = x[which(x$recolonization == recolonization), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$extRate == extRate), ]
y = y[which(y$migRate == 0 | y$migRate == 1 | y$migRate == 2 | y$migRate == 3 | y$migRate == 4 | y$migRate == 5 | y$migRate == 6 | y$migRate == 7 | y$migRate == 8 | y$migRate == 9 | y$migRate == 10), ] 


cnt = -0.2
for(i in c(0, 0.1, 0.5, 0.9, 1)){ # loop over selfing rates
	cnt = cnt + 0.2
	z = y[which(y$selfingRate == i), ]
	if(i == 0){
		plot(z$migRate, z$meanFemAllocCosexual, xlim = c(0, 10), ylim = c(0, 1), pch = 21, col = "black", bg = grey(1-cnt), xlab = "mean number of immigrants", ylab = "proportion female allocation", cex.lab = 1.2, cex.axis = 1.2, main = "extinction rate = 0.3")
#		abline(h = 0.5, lty = 2, lwd = 1.25)
	}else{
		points(z$migRate, z$meanFemAllocCosexual, pch = 21, col = "black", bg = grey(1-cnt))
	}

	legend("bottomleft", legend = c("selfing = 1", "selfing = 0.9","selfing = 0.5","selfing = 0.1","selfing = 0"), pch = 21, pt.bg = c(grey(0.2), grey(0.4), grey(0.6), grey(0.8), grey(1)), bty = "n", y.intersp = 0.95)

}


setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures/main_figures")
dev.print(pdf, "figure_3.pdf", bg="white")
dev.off()


