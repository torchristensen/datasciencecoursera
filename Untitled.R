monitorData.df <- data.frame()

pollutantmean <- function(directory, pollutant, id)
{
  #that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors
  
  filesList <- list.files(directory, pattern="*.csv", full.names=TRUE)
  for(i in id)
  {
    monitorData.df <- rbind(monitorData.df,read.csv(filesList[i]))
  }
  mean(monitorData.df[[pollutant]],na.rm = TRUE)
  round(mean(monitorData.df[[pollutant]],na.rm = TRUE),3)
}

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

corr <- function(directory, threshold)
{
  
}