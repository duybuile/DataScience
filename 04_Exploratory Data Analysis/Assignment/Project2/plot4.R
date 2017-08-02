plot4 <- function(){
  
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  
  #take a smaller set of data before merging
  NEI <- subset(NEI, select = c("SCC", "Emissions", "year"))
  SCC <- subset(SCC, select = c("SCC", "EI.Sector"))
  
  #Merge data
  merged <- merge(x = NEI, y = SCC, by.x = "SCC", by.y = "SCC", all.x = TRUE)
  merged$EI.Sector <- as.character(merged$EI.Sector)
  #Extract data from Coal, look at the EI.Sector column and find those having the word "Coal"
  coalSource <- merged[grep("Coal", merged$EI.Sector, value = FALSE, fixed = FALSE),]
  #Calculate total emissions per year and save it as a new data frame
  totalE <- aggregate(coalSource$Emissions, by = list(coalSource$year), sum)
  #Change the column names
  colnames(totalE) <- c("years", "TotalEmissions")
  
  library(datasets)
  png(filename = "plot4.png", width = 480, height = 480)
  with(totalE, barplot( totalE$TotalEmissions, totalE$years,
                        main = "Pollutant emission from Coal level per year", 
                        names.arg=c("1999", "2002", "2005", "2008"), 
                        col="red", xlab = "Years", ylab = "Total Emissions"))
  dev.off()
}