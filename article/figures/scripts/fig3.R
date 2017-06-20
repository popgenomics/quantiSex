# Fst Coal 
x=read.table("fig_e_i_fstCoal.txt",h=T)
y=as.matrix(x); colnames(y) = gsub("X", "", colnames(y))
plot3var(t(y), couleurs = c("white", "yellow", "red", "black"), zlim=c(0,1), xlab="mig rate", ylab="ext rate", zlab=expression(F["ST, coal"]), cex.lab=1.2)
dev.print(pdf, "fig_6_A.pdf", bg="white")
dev.off()

# D
x=read.table("fig_e_i_D.txt",h=T)
y=as.matrix(x); colnames(y) = gsub("X", "", colnames(y))
plot3var(t(y), couleurs = c("white", "yellow", "red", "black"), zlim=c(0,1), xlab="mig rate", ylab="ext rate", zlab="Jost's D", cex.lab=1.2)
dev.print(pdf, "fig_6_D.pdf", bg="white")
dev.off()

# Fst
x=read.table("fig_e_i_fst.txt",h=T)
y=as.matrix(x); colnames(y) = gsub("X", "", colnames(y))
plot3var(t(y), couleurs = c("white", "yellow", "red", "black"), zlim=c(0,1), xlab="mig rate", ylab="ext rate", zlab=expression(G["ST"]), cex.lab=1.2)
dev.print(pdf, "fig_6_B.pdf", bg="white")
dev.off()

# gst prime
x=read.table("fig_e_i_gstp.txt",h=T)
y=as.matrix(x); colnames(y) = gsub("X", "", colnames(y))
plot3var(t(y), couleurs = c("white", "yellow", "red", "black"), zlim=c(0,1), xlab="mig rate", ylab="ext rate", zlab=expression(G["STp"]), cex.lab=1.2)
dev.print(pdf, "fig_6_C.pdf", bg="white")
dev.off()

# Hs 
x=read.table("fig_e_i_Hs.txt",h=T)
y=as.matrix(x); colnames(y) = gsub("X", "", colnames(y))
plot3var(t(y), couleurs = c("white", "yellow", "red", "black"), xlab="mig rate", ylab="ext rate", zlab=expression(H["S"]), cex.lab=1.2)

# Ht 
x=read.table("fig_e_i_Ht.txt",h=T)
y=as.matrix(x); colnames(y) = gsub("X", "", colnames(y))
plot3var(t(y), couleurs = c("white", "yellow", "red", "black"), xlab="mig rate", ylab="ext rate", zlab=expression(H["T"]), cex.lab=1.2)

