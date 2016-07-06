setwd("/home/croux/Documents/sex_allocation/res")

x = read.table("bilan.txt", h=T)
x = cleanQuantiSexTable(x)

x = as.data.frame(x)

# figure 2: relation between female allocation and population genetics
recolonization = 1 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]

k1 = y[which(y$recolonization == recolonization), ]

# Fst; Fis; D; Gst
dev.new(width = 13, height = 4)
par(mfrow = c(1, 4), las = 1)
plotbin(k1$meanFemAllocCosexual, k1$Fst, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5,1))
mtext(expression(F["ST"]), 2, line = 2)
plotbin(k1$meanFemAllocCosexual, k1$Gst, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5,1))
mtext(expression(G["ST '"]), 2, line = 2)
plotbin(k1$meanFemAllocCosexual, k1$D, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5,1))
mtext(expression(D["Jost"]), 2, line = 2)
plotbin(k1$meanFemAllocCosexual, k1$Fis, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5,1))
mtext(expression(F["IS"]), 2, line = 2)

dev.print(pdf, "figure_2.pdf", bg="white")
dev.off()


# Figure 3
# effect of selfing rate
# selfing alone
recolonization = 1
fecundity = 5000
extRate = 0

y = x[which(x$recolonization == recolonization), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$extRate == extRate), ]
y = y[which(y$migRate == 0 | y$migRate == 1 | y$migRate == 2 | y$migRate == 3 | y$migRate == 4 | y$migRate == 5 | y$migRate == 6 | y$migRate == 7 | y$migRate == 8 | y$migRate == 9 | y$migRate == 10), ] 

cnt = -0.2
dev.new(width=11, height=6)
par(mfrow = c(1, 2), las = 1)
for(i in c(0, 0.1, 0.5, 0.9, 1)){ # loop over selfing rates
	cnt = cnt + 0.2
	z = y[which(y$selfingRate == i), ]
	if(i == 0){
		plot(z$migRate, z$meanFemAllocCosexual, xlim = c(0, 10), ylim = c(0, 1), pch = 21, col = "black", bg = grey(1-cnt), xlab = "% of immigrants per generation", ylab = "proportion female allocation", cex.lab = 1.2, cex.axis = 1.2, main = "no extinction")
	}else{
		points(z$migRate, z$meanFemAllocCosexual, pch = 21, col = "black", bg = grey(1-cnt))
	}

	legend("bottomright", legend = c("selfing = 1", "selfing = 0.9","selfing = 0.5","selfing = 0.1","selfing = 0"), pch = 21, pt.bg = c(grey(0.2), grey(0.4), grey(0.6), grey(0.8), grey(1)), bty = "n")

}

# selfing + extRate
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
		plot(z$migRate, z$meanFemAllocCosexual, xlim = c(0, 10), ylim = c(0, 1), pch = 21, col = "black", bg = grey(1-cnt), xlab = "% of immigrants per generation", ylab = "proportion female allocation", cex.lab = 1.2, cex.axis = 1.2, main = "extinction rate = 0.3")
	}else{
		points(z$migRate, z$meanFemAllocCosexual, pch = 21, col = "black", bg = grey(1-cnt))
	}

	legend("bottomright", legend = c("selfing = 1", "selfing = 0.9","selfing = 0.5","selfing = 0.1","selfing = 0"), pch = 21, pt.bg = c(grey(0.2), grey(0.4), grey(0.6), grey(0.8), grey(1)), bty = "n")

}

dev.print(pdf, "figure_3.pdf", bg="white")
dev.off()


###################################
# selfing and population genetics #
###################################
# figure S7

pdf("figure_S7.pdf", width = 13, height = 20, bg="white")
par(mfrow = c(5, 4), las = 1)
for(i in c(0, 0.1, 0.5, 0.9, 1)){
	recolonization = 1 # number of recolonizators
	fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
	selfingRate = i # selfing rate
	y = x[which(x$selfingRate == selfingRate), ]
	y = y[which(y$fecundity == fecundity), ]

	k1 = y[which(y$recolonization == recolonization), ]

	# Fst; Fis; D; Gst
	plotbin(k1$meanFemAllocCosexual, k1$Fst, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5, 1))
	mtext(expression(F["ST"]), 2, line = 2)

	plotbin(k1$meanFemAllocCosexual, k1$Gst, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5, 1))
	mtext(expression(G["ST '"]), 2, line = 2)

	plotbin(k1$meanFemAllocCosexual, k1$D, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5, 1))
	mtext(expression(D["Jost"]), 2, line = 2)

	plotbin(k1$meanFemAllocCosexual, k1$Fis, nameA="proportion female allocation", nameB="", cex=1.5, cex.lab=1.5, lwd=1.25, cex.axis=1.5, xlim=c(0.5, 1))
	mtext(expression(F["IS"]), 2, line = 2)
}

dev.off()


