setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures")
# migrant pool model
#x = read.table("bilan.txt", h=T)

# propagule pool model
x = read.table("bilan_herma_propagule.txt", h=T)

# "migrant pool model", to merge with "propagule pool model" for k=1 only
y = read.table("bilan.txt", h=T)
y = y[which(y$fecundity == 5000), ]
y = y[which(y$recolonization == 1), ]

# remove the "recolonizationModel" column:
if("colonizationModel"%in%colnames(x)){
	tmp = which(colnames(x)=="colonizationModel")
	x = x[,-tmp]
}

x_k1 = rbind(x[which(x$recolonization == 1), ], y[which(y$recolonization == 1), ])
rm(y)

x = cleanQuantiSexTable(x)
x_k1 = cleanQuantiSexTable(x_k1)

x = as.data.frame(x)
x_k1 = as.data.frame(x_k1)

saved_x = x
saved_x_k1 = x_k1

# figure 1: effects of metapop dynamics on female allocation 
recolonization = 1 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]

x_k1 = x_k1[which(x_k1$selfingRate == selfingRate), ]
x_k1 = x_k1[which(x_k1$fecundity == fecundity), ]

x_k1 = x_k1[which(x_k1$recolonization == recolonization), ]
k1 = triVariableTable(x_k1$migRate, x_k1$extRate, x_k1$meanFemAllocCosexual)

recolonization = 2 # number of recolonizators
k2 = y[which(y$recolonization == recolonization), ]
k2 = triVariableTable(k2$migRate, k2$extRate, k2$meanFemAllocCosexual)

recolonization = 3 # number of recolonizators
k3 = y[which(y$recolonization == recolonization), ]
k3 = triVariableTable(k3$migRate, k3$extRate, k3$meanFemAllocCosexual)

recolonization = 10 # number of recolonizators
k10 = y[which(y$recolonization == recolonization), ]
k10 = triVariableTable(k10$migRate, k10$extRate, k10$meanFemAllocCosexual)

setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures/figures_tmp")
plot3var(t(k1), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="migration rate", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_1A.pdf", bg="white")
dev.off()

plot3var(t(k2), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="migration rate", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_1B.pdf", bg="white")
dev.off()

setwd("/home/croux/Documents/papier_quantiSex/quantiSex/article/figures/supp_figures")
plot3var(t(k3), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="migration rate", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S5.pdf", bg="white")
dev.off()

plot3var(t(k10), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="migration rate", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S6.pdf", bg="white")
dev.off()

