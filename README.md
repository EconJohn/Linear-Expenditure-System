Creating a Package to Run the LES

The linear expenditure system which was first developed by Richard Stone in 1954 is a demand system which distingishes between subsistance expenditure and supernumerary spending. The main idea is that there exists some base line level of demand necessary for consumer survival and afterward there is some extra income for much more leisurely spending on such commodities.

<p>The LES is a simply from rearranging our marshallian demands for the stone-geary utility function. In general the LES is written as:

![EQ1](http://latex.codecogs.com/gif.latex?p_ix_i%3Dp_i%5Cgamma_i&plus;%5Cbeta_i%28m-%5Csum_jp_j%5Cgamma_j%29%2C%5Cspace%20%5Cspace%20%5Cspace%20j%5Cneq%20i)

The key lies in terms of estimating what exactly our supernumerary spending on all other goods is.

#Estimating substance expenditure

In general we will find consumer data on spending that is of the time series nature. This will definately play a role in most of our estmation of our estimation procedures.

We first want to obtain an estimate for all other spending excluding the good for the system we are estimating.mathematically we are estimating first our gross spending on all other products. this being defined as:

![](http://latex.codecogs.com/gif.latex?%5Csum_jp_jx_j%3Dm-p_ix_i)

Now this isnt very sophisticated and such data can be changed internally. what we want however is what exactly the substance expenditure is in each of these cases.

In Robert Pollak and Terrance J. Wales' paper "Estimation of the Linear Expenditure system" they propose 4 differing methods for estimating our subsistance expenditure for each good. Since we are estimating subsistance expenditure on commodity groups however we are going to modify the estimation proceedures to be for substance spending on all other income.

The estimation proceedures are the following: 

**Constant**

![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3DE%5Bm_t-p_%7Bit%7Dx_%7Bit%7D%5D)
It should be noted that some arbitrary number can be chosen instead. 

**Linear Time Trend**

![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3Da%5E*&plus;%5Calpha_%7Bi%7Dt)

**Porportional Habit Formation (AR(1) without Constant)**
![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3D%5Calpha_i%28m_%7Bt-1%7D-p_%7Bit-1%7Dx_%7Bit-1%7D%29)
**Lagged Consumption Habit Formation (AR(1) with Constant)**
![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3Da_i%5E*&plus;%5Calpha_i%28m_%7Bt-1%7D-p_%7Bit-1%7Dx_%7Bit-1%7D%29)

The reason why we are focused on this aspect first is because in order for us to run this system we require that we know what our substance expenditure is. *we estimate this first*

#Estimating the LES
In terms of running the LES we are running a seemingly unrelated regressions system, where we estimate $n-1$ equations by this method and the last one by OLS.

Since we are estimating expenditure we do not need to worry about having specific price and quantity data. Rather we can deal with aggregates.

#Running the Code
```{r}
#Load Data
df<-read.csv("C:\\Users\\jakea\\Desktop\\Consumer Data 1999to2019.csv")
attach(df)
```

```{r}
subT<-coef(arima(I(Household.final.consumption.expenditure-Tobacco),order=c(1,0,0)))
aothspendminustobacco<-I(subT[1]*(Household.final.consumption.expenditure-Tobacco))
```


#Data
A dataset has been pulled from statscanada data on quarterly consumer spending from 1999-2019 (approx 80 observations).

