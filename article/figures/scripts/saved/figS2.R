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


# k = 2
recolonization = 2
y = x[which(x$recolonization == recolonization), ]

y_tmp = y[which(y$extRate == 0), ]
plot(y_tmp$migRate, y_tmp$meanFemAllocCosexual, ylim = c(0.45, 1), col="blue")

y_tmp = y[which(y$extRate == 0.1), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual, col="red")

y_tmp = y[which(y$extRate == 0.3), ]
points(y_tmp$migRate, y_tmp$meanFemAllocCosexual)


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

