---
title       : Fuel Economy Information
subtitle    : 
author      : Venkat Vasam
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Overview

1. Summary of the data set variables
2. R Code To Show Box Plot of Fuel economy based on number of Cylinders
3. Sample Box Plot View of App for Fuel economy based on number of Cylinders

--- .class #id 

## Summary of the data set variables


```
 manufacturer          model               displ            year     
 Length:234         Length:234         Min.   :1.600   Min.   :1999  
 Class :character   Class :character   1st Qu.:2.400   1st Qu.:1999  
 Mode  :character   Mode  :character   Median :3.300   Median :2004  
                                       Mean   :3.472   Mean   :2004  
                                       3rd Qu.:4.600   3rd Qu.:2008  
                                       Max.   :7.000   Max.   :2008  
      cyl           trans               drv                 cty       
 Min.   :4.000   Length:234         Length:234         Min.   : 9.00  
 1st Qu.:4.000   Class :character   Class :character   1st Qu.:14.00  
 Median :6.000   Mode  :character   Mode  :character   Median :17.00  
 Mean   :5.889                                         Mean   :16.86  
 3rd Qu.:8.000                                         3rd Qu.:19.00  
 Max.   :8.000                                         Max.   :35.00  
      hwy             fl               class          
 Min.   :12.00   Length:234         Length:234        
 1st Qu.:18.00   Class :character   Class :character  
 Median :24.00   Mode  :character   Mode  :character  
 Mean   :23.44                                        
 3rd Qu.:27.00                                        
 Max.   :44.00                                        
```

--- .class #id 


##  R Code To Show Box Plot of Fuel economy based on number of Cylinders



```r
library(ggplot2)
library(dplyr)
library(gridExtra)
xTitle<-'Number of Cylinderss'
xVar<-"cyl"
yVarH<-"Highway"
yVarC<-"City"
mpginshwy<-data.frame(mpg[,xVar],mpg$hwy)
colnames(mpginshwy) <- c(xVar, yVarH)
mpginscty<-data.frame(mpg[,xVar],mpg$cty)
colnames(mpginscty) <- c(xVar, yVarC)
plotinshwy<-ggplot(mpginshwy, aes_(x=as.name(xVar), y=as.name(yVarH),color=as.name(yVarH) ))
+geom_boxplot()
plotinscty<-ggplot(mpginscty, aes_(x=as.name(xVar), y=as.name(yVarC),color=as.name(yVarC) ))
+geom_boxplot()
grid.arrange(plotinshwy,plotinscty)
```

--- .class #id 

## Sample Box Plot View of App for Fuel economy based on number of Cylinders

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)
