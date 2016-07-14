setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures")

# propagule pool model
x = read.table("bilan_herma_propagule.txt", h=T)

fecundity = 5000
selfing = 0
x = x[which(x$fecundity == fecundity), ]
x = x[which(x$selfingRate == selfing), ]

# remove the "recolonizationModel" column:
if("colonizationModel"%in%colnames(x)){
	tmp = which(colnames(x)=="colonizationModel")
	x = x[,-tmp]
}

x = cleanQuantiSexTable(x)
x = as.data.frame(x)

setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures/supp_figures")
dev.new(width = 10, height = 7.5)
par(mfrow = c(2, 2))
# k = 1
recolonization = 1
y = x[which(x$recolonization == recolonization), ]
par(las=1)

y_tmp = y[which(y$extRate == 0), ]
plot(y_tmp$migRate, y_tmp$meanFemAllocCosexual, ylim = c(0.45, 1), ylab = "Proportion female allocation", xlab = "migration rate", pch = 21, bg = grey(1), cex = 1.5, cex.lab = 1.5, cex.axis = 1.5, main = "k = 1", lwd = 0.5)

y_tmp = y[which(y$extRate == 0.1), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)

y_tmp = y[which(y$extRate == 0.3), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5)

legend("topright", legend = c("extinction = 0", "extinction = 0.1", "extinction = 0.3"), pch = 21, pt.bg = c(grey(1), grey(0.5), grey(0)), bty = "n", cex = 1.5, pt.lwd = 0.5)


# k = 2
recolonization = 2
y = x[which(x$recolonization == recolonization), ]
par(las=1)

y_tmp = y[which(y$extRate == 0), ]
plot(y_tmp$migRate, y_tmp$meanFemAllocCosexual, ylim = c(0.45, 1), ylab = "Proportion female allocation", xlab = "migration rate", pch = 21, bg = grey(1), cex = 1.5, cex.lab = 1.5, cex.axis = 1.5, main = "k = 2", lwd = 0.5)

y_tmp = y[which(y$extRate == 0.1), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)

y_tmp = y[which(y$extRate == 0.3), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5)

legend("topright", legend = c("extinction = 0", "extinction = 0.1", "extinction = 0.3"), pch = 21, pt.bg = c(grey(1), grey(0.5), grey(0)), bty = "n", cex = 1.5, pt.lwd = 0.5)


# k = 3
recolonization = 3
y = x[which(x$recolonization == recolonization), ]
par(las=1)

y_tmp = y[which(y$extRate == 0), ]
plot(y_tmp$migRate, y_tmp$meanFemAllocCosexual, ylim = c(0.45, 1), ylab = "Proportion female allocation", xlab = "migration rate", pch = 21, bg = grey(1), cex = 1.5, cex.lab = 1.5, cex.axis = 1.5, main = "k = 3", lwd = 0.5)

y_tmp = y[which(y$extRate == 0.1), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)

y_tmp = y[which(y$extRate == 0.3), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5)

legend("topright", legend = c("extinction = 0", "extinction = 0.1", "extinction = 0.3"), pch = 21, pt.bg = c(grey(1), grey(0.5), grey(0)), bty = "n", cex = 1.5, pt.lwd = 0.5)


# k = 10
recolonization = 10
y = x[which(x$recolonization == recolonization), ]
par(las=1)

y_tmp = y[which(y$extRate == 0), ]
plot(y_tmp$migRate, y_tmp$meanFemAllocCosexual, ylim = c(0.45, 1), ylab = "Proportion female allocation", xlab = "migration rate", pch = 21, bg = grey(1), cex = 1.5, cex.lab = 1.5, cex.axis = 1.5, main = "k = 10", lwd = 0.5)

y_tmp = y[which(y$extRate == 0.1), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)

y_tmp = y[which(y$extRate == 0.3), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5)

legend("topright", legend = c("extinction = 0", "extinction = 0.1", "extinction = 0.3"), pch = 21, pt.bg = c(grey(1), grey(0.5), grey(0)), bty = "n", cex = 1.5, pt.lwd = 0.5)

dev.print(pdf, "figure_S2.pdf", bg="white")
dev.off()

