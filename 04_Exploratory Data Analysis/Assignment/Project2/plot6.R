plot6 <- function(){
  
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  
  #take a smaller set of data before merging (remove unncessary columns)
  NEI <- subset(NEI, select = c("SCC", "fips", "Emissions", "year"))
  SCC <- subset(SCC, select = c("SCC", "SCC.Level.One"))
  
  state <- NEI[NEI$fips %in% c("24510", "06037"),]
  #Merge data
  merged <- merge(x = state, y = SCC, by.x = "SCC", by.y = "SCC", all.x = TRUE)
  merged$SCC.Level.One <- as.character(merged$SCC.Level.One)
  #Extract data from Mobile Sources
  mobileSource <- merged[(merged$SCC.Level.One %in% c("Mobile Sources")),]
  #Calculate total emissions per year and save it as a new data frame
  totalE <- aggregate(mobileSource$Emissions, by = list(mobileSource$year, mobileSource$fips), sum)
  #Change the column names
  colnames(totalE) <- c("years", "state", "TotalEmissions")
  
  library(ggplot2)
  g <- qplot(factor(years),
             data=totalE,
             geom="bar",
             fill=state,
             weight=TotalEmissions,
             position="dodge",
             main = "Pollutant emission from Mobile Vehicle Source per year", 
             xlab="Years",
             ylab="Total Emissions") + 
    scale_fill_discrete(name="State",
                        breaks=c("06037", "24510"),
                        labels=c("California", "Baltimore"))
  ggsave(filename = "plot6.png", plot = g, scale = 0.7, dpi = 72)
}