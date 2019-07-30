 <script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
        inlineMath: [['$','$']]
      }
    });
  </script>
  <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
<h1>Creating a Package to Run the LES<h1>

<p>The linear expenditure system which was first developed by Richard Stone in 1954 is a demand system which distingishes between subsistance expenditure and supernumerary spending. The main idea is that there exists some base line level of demand necessary for consumer survival and afterward there is some extra income for much more leisurely spending on such commodities.</p>

<p>The LES is a simply from rearranging our marshallian demands for the stone-geary utility function. In general the LES is written as:
  :<math>p_ix_i=p_i\gamma_i+\beta_i(m-\sum_jp_j\gamma_j),\space \space \space j\neq i</math>
The key lies in terms of estimating what exactly our supernumerary spending on all other goods is.

#Estimating substance expenditure

In general we will find consumer data on spending that is of the time series nature. This will definately play a role in most of our estmation of our estimation procedures.

We first want to obtain an estimate for all other spending excluding the good for the system we are estimating.mathematically we are estimating first our gross spending on all other products. this being defined as:

$$\sum_jp_jx_j=m-p_ix_i$$

Now this isnt very sophisticated and such data can be changed internally. what we want however is what exactly the substance expenditure is in each of these cases.

In Robert Pollak and Terrance J. Wales' paper "Estimation of the Linear Expenditure system" they propose 4 differing methods for estimating our subsistance expenditure for each good. Since we are estimating subsistance expenditure on commodity groups however we are going to modify the estimation proceedures to be for substance spending on all other income.

The estimation proceedures are the following:

**Constant**
$$\sum_{j}p_{jt}\gamma_{jt}=E[m_t-p_{it}x_{it}]$$

It should be noted that some arbitrary number can be chosen instead. 

**Linear Time Trend**

$$\sum_{j}p_{jt}\gamma_{jt}=a^*+\alpha_{it}$$

**Porportional Habit Formation (AR(1) without Constant)**
$$\sum_{j}p_{jt}\gamma_{jt}=\alpha_i(m_{t-1}-p_{it-1}x_{it-1})$$

**Lagged Consumption Habit Formation (AR(1) with Constant)**
$$\sum_{j}p_{jt}\gamma_{jt}=a_i^*+\alpha_i(m_{t-1}-p_{it-1}x_{it-1})$$

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

