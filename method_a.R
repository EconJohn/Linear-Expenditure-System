#' The Linear Expendature System (LES)
#' 
#' The following is a method for estimating the expendature of a given good relative to 
#' other goods.
#'
#' First lets import the data set. 
#' 
library(RCurl)
dt<-getURLContent("https://raw.githubusercontent.com/EconJohn/Linear-Expenditure-System/master/Consumer%20Data%201999to2019.csv?token=ALCCTHUSIY47LI55QJ2RNXC5JB6DI")

dt<-read.csv(text=dt)

dtt<-lapply(dt, function(x) gsub(",","",x))

dtt<-lapply(dtt,as.numeric)

dtt<-dtt[-1]

dtt<- as.data.frame(dtt)
#' Lets estimate the demand for tobacco (our X_i) by using the LES framework.
#' 
#' Step 1: Lets find our method for estimating our supernumerary income (M - sum(P_j*X_j)) where j!=i 
#' (i.e. excluding tobacco expendature)
#' 
#' Option c: Use of an autoregressive process of all other expenditure besides for tobacco


require (forecast)
method_c <- function(data, total_expenditure_vector, time_var){
  
  #' Get all other spending besides for the total expendature data
  all_other_spending <- lapply(data, function(x) (total_expenditure_vector - x))
  
  all_other_spending <- as.data.frame(all_other_spending)
  
  all_other_spending
  
  #' Run all other spending through an AR-1 process.

  coef_substance_expenditure <- lapply(all_other_spending,
                                       function(x) coef(auto.arima(x)))

  coef_substance_expenditure <- lapply(coef_substance_expenditure, function(x) x[1])
  
  cse<- list()
  for(i in 1: length(coef_substance_expenditure)){
    if(names(coef_substance_expenditure[[i]])=="ar1"){
      cse[[i]]<-coef_substance_expenditure[[i]]
      names(cse[[i]])<-names(coef_substance_expenditure[i])
    }
  }
cse <-unlist(cse)
coef_substance_expenditure <- unlist(coef_substance_expenditure)
  # Get substance expenditure

  substance_expenditure <- I(coef_substance_expenditure * all_other_spending)

  
  # Estimate the LES

  LES <- lapply(data,
                function(y) lm(y ~ I(substance_expenditure - total_expenditure_vector )))

  LES


 }

####WE ARE USING THIS BROOOOOOOOO

lapply(dtt, function(x) summary(lm(x ~ dtt$Household.final.consumption.expenditure...C.)))


 }
