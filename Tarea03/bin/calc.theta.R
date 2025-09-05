calc.theta <- function(Ne, u) {
  ##Arguments:
  #Ne: Effective population size
  #u: (mu) - per-generation mutation rate of the population of interest
  
  ##Function
  #calculate theta
  theta <-  4*Ne*u
  
  theta
}