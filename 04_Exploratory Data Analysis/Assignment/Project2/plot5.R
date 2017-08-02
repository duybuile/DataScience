plot5 <- function(){
  
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  
  #take a smaller set of data before merging
  NEI <- subset(NEI, select = c("SCC", "fips", "Emissions", "year"))
  SCC <- subset(SCC, select = c("SCC", "SCC.Level.One"))
  
  #Subset data of Baltimore
  baltimore <- NEI[NEI$fips %in% c("24510"),]
  #Merge data
  merged <- merge(x = baltimore, y = SCC, by.x = "SCC", by.y = "SCC", all.x = TRUE)
  merged$SCC.Level.One <- as.character(merged$SCC.Level.One)
  #Extract data from Mobile Sources
  mobileSource <- merged[(merged$SCC.Level.One %in% c("Mobile Sources")),]
  #Calculate total emissions per year and save it as a new data frame
  totalE <- aggregate(mobileSource$Emissions, by = list(mobileSource$year), sum)
  #Change the column names
  colnames(totalE) <- c("years", "TotalEmissions")
  
  library(datasets)
  png(filename = "plot5.png", width = 520, height = 520)
  with(totalE, barplot( totalE$TotalEmissions, totalE$years,
                        main = "Pollutant emission from Mobile Vehicle Source in Baltimore per year", 
                        names.arg=c("1999", "2002", "2005", "2008"), 
                        col="red", xlab = "Years", ylab = "Total Emissions"))
  dev.off()
}