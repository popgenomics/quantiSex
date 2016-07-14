setwd("/home/croux/Documents/sex_allocation/res")

x = read.table("bilan.txt", h=T)
x = cleanQuantiSexTable(x)

x = as.data.frame(x) 
# figure S8: effects of metapop dynamics on population genetics for k==1
recolonization = 1 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$recolonization == recolonization), ]

fst = triVariableTable(y$migRate, y$extRate, y$Fst)
gst = triVariableTable(y$migRate, y$extRate, y$gst)
Gst = triVariableTable(y$migRate, y$extRate, y$Gst)
GGst = triVariableTable(y$migRate, y$extRate, y$GGst)
fis = triVariableTable(y$migRate, y$extRate, y$Fis)
fit = triVariableTable(y$migRate, y$extRate, y$Fit)
D = triVariableTable(y$migRate, y$extRate, y$D)

plot3var(t(fst), zlim=c(0, 1), zlab=expression(F["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8A.pdf", bg="white")
dev.off()

plot3var(t(gst), zlim=c(0, 1), zlab=expression(G["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8B.pdf", bg="white")
dev.off()

plot3var(t(Gst), zlim=c(0, 1), zlab=expression(G["STp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8C.pdf", bg="white")
dev.off()

plot3var(t(GGst), zlim=c(0, 1), zlab=expression(G["STpp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8D.pdf", bg="white")
dev.off()

plot3var(t(fis), zlim=c(0, 1), zlab=expression(F["IS"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8E.pdf", bg="white")
dev.off()

plot3var(t(fit), zlim=c(0, 1), zlab=expression(F["IT"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8F.pdf", bg="white")
dev.off()

plot3var(t(D), zlim=c(0, 1), zlab=expression(D["Jost"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=1")
dev.print(pdf, "figure_S8G.pdf", bg="white")
dev.off()

# figure S9: effects of metapop dynamics on population genetics for k==2
recolonization = 2 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$recolonization == recolonization), ]

fst = triVariableTable(y$migRate, y$extRate, y$Fst)
gst = triVariableTable(y$migRate, y$extRate, y$gst)
Gst = triVariableTable(y$migRate, y$extRate, y$Gst)
GGst = triVariableTable(y$migRate, y$extRate, y$GGst)
fis = triVariableTable(y$migRate, y$extRate, y$Fis)
fit = triVariableTable(y$migRate, y$extRate, y$Fit)
D = triVariableTable(y$migRate, y$extRate, y$D)

plot3var(t(fst), zlim=c(0, 1), zlab=expression(F["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9A.pdf", bg="white")
dev.off()

plot3var(t(gst), zlim=c(0, 1), zlab=expression(G["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9B.pdf", bg="white")
dev.off()

plot3var(t(Gst), zlim=c(0, 1), zlab=expression(G["STp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9C.pdf", bg="white")
dev.off()

plot3var(t(GGst), zlim=c(0, 1), zlab=expression(G["STpp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9D.pdf", bg="white")
dev.off()

plot3var(t(fis), zlim=c(0, 1), zlab=expression(F["IS"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9E.pdf", bg="white")
dev.off()

plot3var(t(fit), zlim=c(0, 1), zlab=expression(F["IT"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9F.pdf", bg="white")
dev.off()

plot3var(t(D), zlim=c(0, 1), zlab=expression(D["Jost"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=2")
dev.print(pdf, "figure_S9G.pdf", bg="white")
dev.off()

# figure S10: effects of metapop dynamics on population genetics for k==3
recolonization = 3 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$recolonization == recolonization), ]

fst = triVariableTable(y$migRate, y$extRate, y$Fst)
gst = triVariableTable(y$migRate, y$extRate, y$gst)
Gst = triVariableTable(y$migRate, y$extRate, y$Gst)
GGst = triVariableTable(y$migRate, y$extRate, y$GGst)
fis = triVariableTable(y$migRate, y$extRate, y$Fis)
fit = triVariableTable(y$migRate, y$extRate, y$Fit)
D = triVariableTable(y$migRate, y$extRate, y$D)

plot3var(t(fst), zlim=c(0, 1), zlab=expression(F["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10A.pdf", bg="white")
dev.off()

plot3var(t(gst), zlim=c(0, 1), zlab=expression(G["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10B.pdf", bg="white")
dev.off()

plot3var(t(Gst), zlim=c(0, 1), zlab=expression(G["STp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10C.pdf", bg="white")
dev.off()

plot3var(t(GGst), zlim=c(0, 1), zlab=expression(G["STpp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10D.pdf", bg="white")
dev.off()

plot3var(t(fis), zlim=c(0, 1), zlab=expression(F["IS"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10E.pdf", bg="white")
dev.off()

plot3var(t(fit), zlim=c(0, 1), zlab=expression(F["IT"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10F.pdf", bg="white")
dev.off()

plot3var(t(D), zlim=c(0, 1), zlab=expression(D["Jost"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=3")
dev.print(pdf, "figure_S10G.pdf", bg="white")
dev.off()

# figure S11: effects of metapop dynamics on population genetics for k==10
recolonization = 10 # number of recolonizators
fecundity = 5000 # number of babies produced by hermaphrodites when female allocation == 1
selfingRate = 0 # selfing rate
y = x[which(x$selfingRate == selfingRate), ]
y = y[which(y$fecundity == fecundity), ]
y = y[which(y$recolonization == recolonization), ]

fst = triVariableTable(y$migRate, y$extRate, y$Fst)
gst = triVariableTable(y$migRate, y$extRate, y$gst)
Gst = triVariableTable(y$migRate, y$extRate, y$Gst)
GGst = triVariableTable(y$migRate, y$extRate, y$GGst)
fis = triVariableTable(y$migRate, y$extRate, y$Fis)
fit = triVariableTable(y$migRate, y$extRate, y$Fit)
D = triVariableTable(y$migRate, y$extRate, y$D)

plot3var(t(fst), zlim=c(0, 1), zlab=expression(F["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11A.pdf", bg="white")
dev.off()

plot3var(t(gst), zlim=c(0, 1), zlab=expression(G["ST"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11B.pdf", bg="white")
dev.off()

plot3var(t(Gst), zlim=c(0, 1), zlab=expression(G["STp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11C.pdf", bg="white")
dev.off()

plot3var(t(GGst), zlim=c(0, 1), zlab=expression(G["STpp"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11D.pdf", bg="white")
dev.off()

plot3var(t(fis), zlim=c(0, 1), zlab=expression(F["IS"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11E.pdf", bg="white")
dev.off()

plot3var(t(fit), zlim=c(0, 1), zlab=expression(F["IT"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11F.pdf", bg="white")
dev.off()

plot3var(t(D), zlim=c(0, 1), zlab=expression(D["Jost"]), xlab="% of immigrants", ylab="extinction rate", couleurs=c("white", "yellow", "red", "black"), main="k=10")
dev.print(pdf, "figure_S11G.pdf", bg="white")
dev.off()


