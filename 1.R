
library(ggplot2)
library(dplyr)
library(gridExtra)


xTitle<-'Cylinders'

xVar<-"cyl"
yVarH<-"Highway"
yVarC<-"City"

mpginshwy<-data.frame(mpg[,xVar],mpg$hwy)

colnames(mpginshwy) <- c(xVar, yVarH)

mpginscty<-data.frame(mpg[,xVar],mpg$cty)

colnames(mpginscty) <- c(xVar, yVarC)

plotinshwy<-ggplot(mpginshwy, aes_(x=as.name(xVar), y=as.name(yVarH),color=as.name(yVarH) ))+geom_boxplot()


plotinscty<-ggplot(mpginscty, aes_(x=as.name(xVar), y=as.name(yVarC),color=as.name(yVarC) ))+geom_boxplot()

grid.arrange(plotinshwy,plotinscty)
