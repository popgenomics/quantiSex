setwd("/home/croux/Documents/sex_allocation/res")

x = read.table("bilan.txt", h=T)
x = cleanQuantiSexTable(x)

x = as.data.frame(x)

# figure 1: expectations when k == 1, no stochasticity in N over demes, strongly reduced selfing
recolonization = 1 # number of recolonizators
fecundity = 5 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

compare_matrix(t(expFst), t(obsFst), xlab="% of immigrants", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))

dev.print(pdf, "figure_S1.pdf", bg="white")
dev.off()

# figure S1: expectations when k == 2
recolonization = 2 # number of recolonizators
fecundity = 5 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]
#x = x[which(x$recolonization==recolonization & x$fecundity==fecundity),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

compare_matrix(t(expFst), t(obsFst), xlab="% of immigrants", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))
dev.print(pdf, "figure_S2.pdf", bg="white")
dev.off()

# figure S2: expectations when k == 3
recolonization = 3 # number of recolonizators
fecundity = 5 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]
#x = x[which(x$recolonization==recolonization & x$fecundity==fecundity),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

compare_matrix(t(expFst), t(obsFst), xlab="% of immigrants", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))
dev.print(pdf, "figure_S3.pdf", bg="white")
dev.off()


# figure S3: expectations when k == 10
recolonization = 10 # number of recolonizators
fecundity = 5 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate

y = x[which(x$recolonization==recolonization & x$fecundity==fecundity & x$selfingRate==selfingRate),]
#x = x[which(x$recolonization==recolonization & x$fecundity==fecundity),]

obsFst = triVariableTable(y$migRate, y$extRate, y$Fst)
expFst = triVariableTable(y$migRate, y$extRate, y$expFST_Nobs)

compare_matrix(t(expFst), t(obsFst), xlab="% of immigrants", ylab="extinction rate", zlab=expression(F["ST"]), couleurs=c("white", "yellow", "red", "black"), watermark = F, zlim=c(0, 1), zlimResiduals=c(-1,1))
dev.print(pdf, "figure_S4.pdf", bg="white")
dev.off()


