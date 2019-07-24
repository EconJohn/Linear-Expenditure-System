# Linear-Expenditure-System
The base for working on the linear expenditure package in R

# Overview of Project
Essentially we just want to run a regression centered around some value
Known in economic theory as the "level of substance" or "Substance-Expenditure"

We can calculate this substance expenditure in 4 ways:
1) The average total expenditure or an arbitray value .
2) we run a regression of our total expenditure on time.
3) We use an AR(1) Process without a constant for our total expenditure.
4) We usea an AR(1) with a constant for our total exenditure.

In terms of a practical estimation proceedure we will do the following:
1)Estimate substance expenditure using one of the 4 methods above
2)Center the data around such a process for an estimate of supernumary income
3)Run system of linear equations using SUR econometric method (get this from R package "systemfit")
