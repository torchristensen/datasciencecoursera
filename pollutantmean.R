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