<h1>Creating a Package to Run the LES</h1>

The linear expenditure system which was first developed by Richard Stone in 1954 is a demand system which distingishes between subsistance expenditure and supernumerary spending. The main idea is that there exists some base line level of demand necessary for consumer survival and afterward there is some extra income for much more leisurely spending on such commodities.

<p>The LES is a simply from rearranging our marshallian demands for the stone-geary utility function. In general the LES is written as:

![EQ1](http://latex.codecogs.com/gif.latex?p_ix_i%3Dp_i%5Cgamma_i&plus;%5Cbeta_i%28m-%5Csum_jp_j%5Cgamma_j%29%2C%5Cspace%20%5Cspace%20%5Cspace%20j%5Cneq%20i)

The key lies in terms of estimating what exactly our supernumerary spending on all other goods is.

<h1>Estimating substance expenditure</h1>

In general we will find consumer data on spending that is of the time series nature. This will definately play a role in most of our estmation of our estimation procedures.

We first want to obtain an estimate for all other spending excluding the good for the system we are estimating.mathematically we are estimating first our gross spending on all other products. this being defined as:

![](http://latex.codecogs.com/gif.latex?%5Csum_jp_jx_j%3Dm-p_ix_i)

Now this isnt very sophisticated and such data can be changed internally. what we want however is what exactly the substance expenditure is in each of these cases.

In Robert Pollak and Terrance J. Wales' paper "Estimation of the Linear Expenditure system" they propose 4 differing methods for estimating our subsistance expenditure for each good. Since we are estimating subsistance expenditure on commodity groups however we are going to modify the estimation proceedures to be for substance spending on all other income.

The estimation proceedures are the following: 

**Constant**<br>
![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3DE%5Bm_t-p_%7Bit%7Dx_%7Bit%7D%5D)
<br>It should be noted that some arbitrary number can be chosen instead. 

**Linear Time Trend**<br>
![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3Da%5E*&plus;%5Calpha_%7Bi%7Dt)

**Porportional Habit Formation (AR(1) without Constant)**<br>
![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3D%5Calpha_i%28m_%7Bt-1%7D-p_%7Bit-1%7Dx_%7Bit-1%7D%29)

**Lagged Consumption Habit Formation (AR(1) with Constant)**<br>
![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%7Dp_%7Bjt%7D%5Cgamma_%7Bjt%7D%3Da_i%5E*&plus;%5Calpha_i%28m_%7Bt-1%7D-p_%7Bit-1%7Dx_%7Bit-1%7D%29)
<br>The reason why we are focused on this aspect first is because in order for us to run this system we require that we know what our substance expenditure is. *we estimate this first*

<h1>Estimating the LES</h1>
In terms of running the LES we are running a seemingly unrelated regressions system, where we estimate $n-1$ equations by this method and the last one by OLS.

Since we are estimating expenditure we do not need to worry about having specific price and quantity data. Rather we can deal with aggregates.

<h1>The LES in R</h1>

Below is the code for the basic estimation proceedure. it is not complete or functional. The main goal is to prodouce a set of equations.

```{r}

#Step1: Load Data set
#Data is in millions of dollars
df<-read.csv("")
attach(df)
names(df)
dim(df)
View(df)

#Step2: Estimate of essential expenditure by obtaining fitted values over time
aconsumption<-lm(Housing..water..electricity..gas.and.other.fuels~Time)
acon<-fitted(aconsumption)

#Step3: Identify system of equations to estimate.
gasr<-Gas~I(Housing..water..electricity..gas.and.other.fuels-acon)
eler<-Electricity~I(Housing..water..electricity..gas.and.other.fuels-acon)
waterr<-Water.supply.and.sanitation.services~I(Housing..water..electricity..gas.and.other.fuels-acon)

#Step 4: Estimate linear expenditure system:
LES<-systemfit(list(gasreg=gasr, elecreg=eler,waterreg=waterr),method="SUR")
summary(LES)
```

