setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures")

x = read.table("bilan.txt", h=T)

fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate

x = x[which(x$fecundity==fecundity & x$selfingRate==selfingRate),]

x = cleanQuantiSexTable(x)

x = as.data.frame(x)

# figure S1_A: expectations when k == 1, no stochasticity in N over demes, strongly reduced selfing
recolonization = 1 # number of recolonizators
y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

compare_matrix(t(expFst), t(obsFst), xlab="migration rate", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))

setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures/supp_figures")
dev.print(pdf, "figure_S1_A.pdf", bg="white")
dev.off()

# expectations when k == 2
recolonization = 2 # number of recolonizators

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]
#x = x[which(x$recolonization==recolonization & x$fecundity==fecundity),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

# compare_matrix(t(expFst), t(obsFst), xlab="migration rate", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))


# expectations when k == 3
recolonization = 3 # number of recolonizators

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]
#x = x[which(x$recolonization==recolonization & x$fecundity==fecundity),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

# compare_matrix(t(expFst), t(obsFst), xlab="migration rate", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))


# figure S1_B: expectations when k == 10
recolonization = 10 # number of recolonizators

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]
#x = x[which(x$recolonization==recolonization & x$fecundity==fecundity),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

compare_matrix(t(expFst), t(obsFst), xlab="migration rate", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))
dev.print(pdf, "figure_S1_B.pdf", bg="white")
dev.off()


