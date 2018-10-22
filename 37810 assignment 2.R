#37810 Assignment 2_Yi Jin step 4

source('~/GitHub/assignment-2-KumamonYJ/function.set.R')

# set coefficient A
trueA <- 5
# set coefficient B
trueB <- 0
# set standard error
trueSd <- 10
# set sample size
sampleSize <- 31


# create independent x-values 
x <- (-(sampleSize-1)/2):((sampleSize-1)/2)
# create dependent values according to ax + b + N(0,sd)
y <-  trueA * x + trueB + rnorm(n=sampleSize,mean=0,sd=trueSd)

# plot picture of x and y, with title "Test Data"
plot(x,y, main="Test Data")


# apply function slopevalues to the sequence
slopelikelihoods <- lapply(seq(3, 7, by=.05), slopevalues )
# plot the sequence and the corresponding outcomes of function slopevalues
plot (seq(3, 7, by=.05), slopelikelihoods , type="l", xlab = "values of slope parameter a", ylab = "Log likelihood")


# assign the startvalue
startvalue = c(4,0,10)
# apply run_metropolis_MCMC function to the startvalue and iterate for 10000 times
chain = run_metropolis_MCMC(startvalue, 10000)
# assign burn-in time
burnIn = 5000
# delete the first burn-in time rows of chain, then calculate the acceptance rate of the remaining rows of chain.
acceptance = 1-mean(duplicated(chain[-(1:burnIn),]))


graphing(chain,5000,30)