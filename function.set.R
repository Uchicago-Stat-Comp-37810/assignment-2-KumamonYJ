#37810 Assignment 2_Yi Jin

# define function likelihood
likelihood <- function(param){
  # assign coefficient a
  a = param[1]
  # assign coefficient b
  b = param[2]
  # assign standard error
  sd = param[3]
  
  # calculate prediction value
  pred = a*x + b
  # return log value of normal distribution function value which satisfies distribution N(pred,sd)
  singlelikelihoods = dnorm(y, mean = pred, sd = sd, log = T)
  # sum up these log values
  sumll = sum(singlelikelihoods)
  # return the total value
  return(sumll)   
}


# Example: plot the likelihood profile of the slope a
slopevalues <- function(x){return(likelihood(c(x, trueB, trueSd)))}



# define prior distribution function
prior <- function(param){
  # assign coefficient a
  a = param[1]
  # assign coefficient b
  b = param[2]
  # assign standard error
  sd = param[3]
  # aprior is the log value of a satisfying uniform distribution from 0 to 10
  aprior = dunif(a, min=0, max=10, log = T)
  # bprior is the log value of b satistying normal distribution
  bprior = dnorm(b, sd = 5, log = T)
  # sdprior is the log value of sd satisfying uniform distribution from 0 to 30
  sdprior = dunif(sd, min=0, max=30, log = T)
  # return sum of these log values
  return(aprior+bprior+sdprior)
}



# define function posterior
posterior <- function(param){
  # return the log value of product of prior and likelihood 
  return (likelihood(param) + prior(param))
}



######## Metropolis algorithm ################

# create proposal function
proposalfunction <- function(param){
  # generate 3 random value for normal distribution
  return(rnorm(3,mean = param, sd= c(0.1,0.5,0.3)))
}



# create Metropolis-Hastings algorithm
run_metropolis_MCMC <- function(startvalue, iterations){
  # create array chain whose dimensions are iterations+1 times 3
  chain = array(dim = c(iterations+1,3))
  # the first row of chain is startvalue
  chain[1,] = startvalue
  # iterate iterations times
  for (i in 1:iterations){
    # assign proposal value based on the chain value of last row
    proposal = proposalfunction(chain[i,])
    # calculate acceptance probability
    probab = exp(posterior(proposal) - posterior(chain[i,]))
    # if the acceptance probability is great than u satisfying uniform distribution from 0 to 1
    if (runif(1) < probab){
      # accept the value and assign that to the next row of chain
      chain[i+1,] = proposal
      # otherwise
    }else{
      # reject the value and assign the last value to the next row of chain
      chain[i+1,] = chain[i,]
    }
  }
  # return value of chain
  return(chain)
}



### Summary: #######################

# set 2 rows and 3 columns subgragh
graphing=function(chain,burnIn,numberclass){
  # set 2 rows and 3 columns subgragh
  par(mfrow = c(2,3))
  # draw the histogram of the last 5000 rows, the first column of chain
  hist(chain[-(1:burnIn),1],nclass=numberclass, , main="Posterior of a", xlab="True value = red line" )
  # draw the mean value of the last 5000 rows, the first column of chain
  abline(v = mean(chain[-(1:burnIn),1]))
  # draw value of trueA by red vertical line
  abline(v = trueA, col="red" )
  # draw the histogram of the last 5000 rows, the second column of chain
  hist(chain[-(1:burnIn),2],nclass=numberclass, main="Posterior of b", xlab="True value = red line")
  # draw the mean value of the last 5000 rows, the second column of chain
  abline(v = mean(chain[-(1:burnIn),2]))
  # draw value of trueB by red vertical line
  abline(v = trueB, col="red" )
  # draw the histogram of the last 5000 rows, the third column of chain
  hist(chain[-(1:burnIn),3],nclass=numberclass, main="Posterior of sd", xlab="True value = red line")
  # draw the mean value of the last 5000 rows, the third column of chain
  abline(v = mean(chain[-(1:burnIn),3]) )
  # draw value of trueSd by red vertical line
  abline(v = trueSd, col="red" )
  # plot the last 5000 rows, the first column of chain
  plot(chain[-(1:burnIn),1], type = "l", xlab="True value = red line" , main = "Chain values of a", )
  # draw value of trueA by red horizontal line
  abline(h = trueA, col="red" )
  # plot the last 5000 rows, the second column of chain
  plot(chain[-(1:burnIn),2], type = "l", xlab="True value = red line" , main = "Chain values of b", )
  # draw value of trueB by red horizontal line
  abline(h = trueB, col="red" )
  # plot the last 5000 rows, the third column of chain
  plot(chain[-(1:burnIn),3], type = "l", xlab="True value = red line" , main = "Chain values of sd", )
  # draw value of trueSd by red horizontal line
  abline(h = trueSd, col="red" )
  
  # for comparison:
  summary(lm(y~x))
}





