#' The Linear Expendature System (LES)
#' 
#' The following is a method for estimating the expendature of a given good relative to 
#' other goods.
#'
#'  
#'(Functions will be renamed in a more appropriate manner)
#'
#'Method (a): Choose the mean
#'
#'Error handling will have to be dealt with 
#'
#'time is defaulted but is user defined from the data set. 

method_a<-function(var,dat,timevar="time"){
  
  #' Var is our good of interest
  var<-sum(var)
  M  <-sum(dat[,-match(c(timevar),names(dat))])  #' This creates our data set  
  
  #' Now lets run the regression (Remember, we are using the mean) 
  #' (I don't remember the type of regression)
  
  mod<-glm(var~(M-mean(M)))
summary(mod)
}


#'Heres an example (with obvious problems)
#'
#'We are using the "freeny" data set from the datasets package

require(datasets)
freeny$time<-rownames(freeny)

method_a(freeny$market.potential,dat=freeny)
