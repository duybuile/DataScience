plot1 <- function(){
  
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  
  #Calculate total emissions per year and save it as a new data frame
  totalE <- aggregate(NEI$Emissions, by = list(NEI$year), sum)
  #Change the column names
  colnames(totalE) <- c("years", "TotalEmissions")
  
  library(datasets)
  png(filename = "plot1.png", width = 480, height = 480)
  with(totalE, barplot( totalE$TotalEmissions, totalE$years,
                        main = "Pollutant emission level per year", 
                        names.arg=c("1999", "2002", "2005", "2008"), 
                        col="red", xlab = "Years", ylab = "Total Emissions"))
  dev.off()
}