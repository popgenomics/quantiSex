setwd("/home/croux/Documents/sex_allocation/res")

x = read.table("bilan.txt", h=T)
x = cleanQuantiSexTable(x)

x = as.data.frame(x)
saved_x = x
# figure 1: effects of metapop dynamics on female allocation 
recolonization = 1 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]

k1 = y[which(y$recolonization == recolonization), ]
k1 = triVariableTable(k1$migRate, k1$extRate, k1$meanFemAllocCosexual)

recolonization = 2 # number of recolonizators
k2 = y[which(y$recolonization == recolonization), ]
k2 = triVariableTable(k2$migRate, k2$extRate, k2$meanFemAllocCosexual)

recolonization = 3 # number of recolonizators
k3 = y[which(y$recolonization == recolonization), ]
k3 = triVariableTable(k3$migRate, k3$extRate, k3$meanFemAllocCosexual)

recolonization = 10 # number of recolonizators
k10 = y[which(y$recolonization == recolonization), ]
k10 = triVariableTable(k10$migRate, k10$extRate, k10$meanFemAllocCosexual)

plot3var(t(k1), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="% of immigrants per generation", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_1A.pdf", bg="white")
dev.off()

plot3var(t(k2), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="% of immigrants per generation", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_1B.pdf", bg="white")
dev.off()

plot3var(t(k3), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="% of immigrants per generation", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S5.pdf", bg="white")
dev.off()

plot3var(t(k10), zlim=c(0.5, 1), zlab="Proportion female allocation", xlab="% of immigrants per generation", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S6.pdf", bg="white")
dev.off()

