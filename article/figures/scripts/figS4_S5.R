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

# k = 1
recolonization = 1
y = x[which(x$recolonization == recolonization), ]

fst = triVariableTable(y$migRate, y$extRate, y$Fst)
gst = triVariableTable(y$migRate, y$extRate, y$gst)
Gst = triVariableTable(y$migRate, y$extRate, y$Gst)
GGst = triVariableTable(y$migRate, y$extRate, y$GGst)
fis = triVariableTable(y$migRate, y$extRate, y$Fis)
fit = triVariableTable(y$migRate, y$extRate, y$Fit)
D = triVariableTable(y$migRate, y$extRate, y$D)

dev.new(width = 15, height = 7)
par(mfrow = c(2, 4), mar = c(4.8, 4.5, 3, 1.8), las = 1)

# Fst
plot(as.numeric(colnames(fst)), fst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(F["ST"]), 2, line = 1.75, cex = 1.25)
points(as.numeric(colnames(fst)), fst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(fst)), fst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

legend("topright", legend = c("extinction = 0", "extinction = 0.1", "extinction = 0.3"), pch = 21, pt.bg = c(grey(1), grey(0.5), grey(0)), bty = "n", cex = 1.5, pt.lwd = 0.5)

# Gst
plot(as.numeric(colnames(gst)), gst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(G["ST"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(gst)), gst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(gst)), gst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# G'st
plot(as.numeric(colnames(Gst)), Gst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(G["ST'"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(Gst)), Gst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(Gst)), Gst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# G''st
plot(as.numeric(colnames(GGst)), GGst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(G["ST''"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(GGst)), GGst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(GGst)), GGst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# Fit
plot(as.numeric(colnames(fit)), fit[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(F["IT"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(fit)), fit[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(fit)), fit[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# D
plot(as.numeric(colnames(D)), D[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(D["Jost"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(D)), D[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(D)), D[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# Fis
plot(as.numeric(colnames(fis)), fis[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(F["IS"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(fis)), fis[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(fis)), fis[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures/supp_figures")
dev.print(pdf, "figure_S4.pdf", bg = "white")
dev.off()

# k = 10
recolonization = 10
y = x[which(x$recolonization == recolonization), ]

fst = triVariableTable(y$migRate, y$extRate, y$Fst)
gst = triVariableTable(y$migRate, y$extRate, y$gst)
Gst = triVariableTable(y$migRate, y$extRate, y$Gst)
GGst = triVariableTable(y$migRate, y$extRate, y$GGst)
fis = triVariableTable(y$migRate, y$extRate, y$Fis)
fit = triVariableTable(y$migRate, y$extRate, y$Fit)
D = triVariableTable(y$migRate, y$extRate, y$D)

dev.new(width = 15, height = 7)
par(mfrow = c(2, 4), mar = c(4.8, 4.5, 3, 1.8), las = 1)

# Fst
plot(as.numeric(colnames(fst)), fst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(F["ST"]), 2, line = 1.75, cex = 1.25)
points(as.numeric(colnames(fst)), fst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(fst)), fst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

legend("topright", legend = c("extinction = 0", "extinction = 0.1", "extinction = 0.3"), pch = 21, pt.bg = c(grey(1), grey(0.5), grey(0)), bty = "n", cex = 1.5, pt.lwd = 0.5)

# Gst
plot(as.numeric(colnames(gst)), gst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(G["ST"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(gst)), gst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(gst)), gst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# G'st
plot(as.numeric(colnames(Gst)), Gst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(G["ST'"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(Gst)), Gst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(Gst)), Gst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# G''st
plot(as.numeric(colnames(GGst)), GGst[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(G["ST''"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(GGst)), GGst[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(GGst)), GGst[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# Fit
plot(as.numeric(colnames(fit)), fit[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(F["IT"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(fit)), fit[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(fit)), fit[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# D
plot(as.numeric(colnames(D)), D[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(D["Jost"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(D)), D[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(D)), D[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

# Fis
plot(as.numeric(colnames(fis)), fis[16, ], ylim = c(0, 1), xlab = "migration rate", ylab = "", pch = 21, bg = grey(0), cex = 1.5, lwd = 0.5, cex.axis = 1.5, cex.lab = 1.5)
mtext(expression(F["IS"]), 2, line = 1.75, cex = 1.5)
points(as.numeric(colnames(fis)), fis[6, ], pch = 21, bg = grey(0.5), cex = 1.5, lwd = 0.5)
points(as.numeric(colnames(fis)), fis[1, ], pch = 21, bg = grey(1), cex = 1.5, lwd = 0.5)

dev.print(pdf, "figure_S5.pdf", bg = "white")
dev.off()

