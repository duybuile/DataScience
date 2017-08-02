plot2 <- function(){
  
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  
  #Subset data of Baltimore
  baltimore <- NEI[NEI$fips %in% c("24510"),]
  #Calculate total emissions per year and save it as a new data frame
  totalE <- aggregate(baltimore$Emissions, by = list(baltimore$year), sum)
  #Change the column names
  colnames(totalE) <- c("years", "TotalEmissions")
  
  library(datasets)
  png(filename = "plot2.png", width = 480, height = 480)
  with(totalE, barplot( totalE$TotalEmissions, totalE$years,
                        main = "Pollutant emission level in Baltimore per year", 
                        names.arg=c("1999", "2002", "2005", "2008"), 
                        col="red", xlab = "Years", ylab = "Total Emissions"))
  dev.off()
}