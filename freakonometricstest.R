#all from https://freakonometrics.hypotheses.org/2390

naissance=read.table(
  "http://freakonometrics.free.fr/naissanceFR2.txt")
attach(naissance)
date=as.Date(date)
plot(date, nbre,cex=.5)
t2=as.POSIXlt(date)
jour=t2$wday
X=naissance$date
Y=naissance$nbre
J=jour
df=data.frame(X,Y,J)
library(splines)
regs=lm(Y~bs(X,df=20),data=df[jour%in%c(0,6),])
Yp=predict(regs,newdata=df)
lines(X,Yp,col="red",lwd=3)
regs=lm(Y~bs(X,df=20),data=df[jour%in%1:5,])
Yp=predict(regs,newdata=df)
lines(X,Yp,col="blue",lwd=3)