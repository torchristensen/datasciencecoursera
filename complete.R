complete <- function(directory, id)
{
  filesList <- list.files(directory, pattern="*.csv", full.names=TRUE)
  cc <- data.frame()
  for(i in id)
  {
    nobs <- sum(complete.cases(read.csv(filesList[i])))
    cc <- rbind(cc, c(i,nobs))
  }
  ccnames <- c("id","nobs")
  colnames(cc) <- ccnames
  cc
}