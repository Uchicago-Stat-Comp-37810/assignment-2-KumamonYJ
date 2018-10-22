#37810 Assignment 2_Yi Jin step 6

source('~/GitHub/assignment-2-KumamonYJ/37810 assignment 2.R')


for(i in 1:10){
  n_iteration=1000*i
  m_error.a=mean(abs(compare_outcomes(n_iteration)[1:10]-5))
  print(paste("The error of estimation of a by iterating ", n_iteration, " times is ",m_error.a))
}


