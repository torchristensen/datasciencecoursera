corr <- function(directory, threshold = 0)
{
  #Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold.
  
  filesList <- list.files(directory, pattern="*.csv", full.names=TRUE)
  correlated <- vector()
  for(i in 1:length(filesList))
  {
    monitorData.df <- read.csv(filesList[i])
    paste(c("full",length(monitorData.df)),sep=" ")
    monitorData.df <- na.omit(monitorData.df)
    paste(c("short",length(monitorData.df)),sep=" ")

    if (sum(complete.cases(monitorData.df)) >= threshold)
    {
      correlated <- c(correlated, cor(x = monitorData.df$nitrate, y = monitorData.df$sulfate))
    }
  }
  #paste(c("correlated:",correlated),sep = " ")
  correlated
}