AV2plot <- function(xstar, ystar, sigma=1, k=1, lims=range(xstar), cex.axis=0.6, cex=1, inset=-0.1){
  n <- length(xstar)
  plot(lims, c(0,-(n+0.5)), type="n", axes=FALSE, xlab=NA, ylab=NA)
  for(i in 1:n){
    abline(h=-i, col="lightgray")
    mu <- xstar[i]
    curve(k*dnorm(x,mu,sigma)-i, from=mu-3*sigma, to=mu+3*sigma, add=TRUE, col="blue")
    mu <- ystar[i]
    curve(k*dnorm(x,mu,sigma)-i, from=mu-3*sigma, to=mu+3*sigma, add=TRUE, col="green")
  }
  axis(2, at=-c((1:n),n+0.5), labels=c(paste("sample",1:n),"........."), hadj=0.5, line=1, las=1, cex.axis=cex.axis, col="white")
  legend("topright", legend=c("labo A","labo B"), text.col=c("blue","green"), 
         inset=c(0,inset), xpd=TRUE, box.col="white", bg=scales::alpha("gray", alpha=0.25), 
         lty=c(1,1), col=c("blue","green"), cex=cex)
}

DAV2plot <- function(xstar, ystar, sigma=1, k=1, lims=range(c(xstar,ystar)), cex.axis=0.6, cex=1, lwd=2, inset=-0.1){
  n <- length(xstar)
  plot(lims, lims, type="n", axes=FALSE, xlab=NA, ylab=NA, asp=1)
  for(i in 1:n){
    abline(h=xstar[i], col="lightgray")
    mu <- xstar[i]
    curve(k*dnorm(x,mu,sigma)+xstar[i], from=mu-3*sigma, to=mu+3*sigma, add=TRUE, col="blue", lwd=lwd)
    mu <- ystar[i]
    curve(k*dnorm(x,mu,sigma)+xstar[i], from=mu-3*sigma, to=mu+3*sigma, add=TRUE, col="green", lwd=lwd)
  }
  axis(2, at=xstar, labels=sapply(1:n, function(i) as.expression(bquote({italic(x)^symbol("\052")}[.(i)]))), hadj=0.5, line=1, las=1, cex.axis=cex.axis, col="white")
  legend("topright", legend=c("labo A","labo B"), text.col=c("blue","green"), 
         inset=c(0,inset), xpd=TRUE, box.col="white", bg=scales::alpha("gray", alpha=0.25), 
         lty=c(1,1), col=c("blue","green"), cex=cex)
}

rotat.dnorm <- function(x0,y0,sigma=1,npoints=100,k=1,...){
  interval <- x0 + 4*c(-1,1)*sigma
  x <- seq(interval[1], interval[2], len=npoints)
  y <- k*dnorm(x,x0,sigma)  
  lines(y+x0,x+y0-x0,type="l",...)
}
