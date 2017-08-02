plot3 <- function(){
  
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  
  #Subset data of Baltimore
  baltimore <- NEI[NEI$fips %in% c("24510"),]
  #subset the data
  totalE <- aggregate(baltimore$Emissions, by = list(baltimore$year, baltimore$type), sum)
  colnames(totalE) <- c("years", "type", "TotalEmissions")
  
  
  library(ggplot2)
  
  g <- ggplot(data = totalE, aes(x = years, y = TotalEmissions)) + 
      geom_line(data = totalE, aes(colour = type) ) +
      labs(x = "years")+
      labs(y = "Total Emissions")+
      labs(title = "Total Emissions at Baltimore from 1999 to 2008")
  ggsave(filename = "plot3.png", plot = g, scale = 0.5, dpi = 72)
  
}