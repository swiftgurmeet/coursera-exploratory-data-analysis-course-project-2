# Packages "dplyr" and "ggplot2" are assumed to be installed.
# The input data files are assumed to be in the working directory.
# dplyr chaining is used frequently in the code using %>%

library(dplyr)
library(ggplot2)

# Read the input data as suggested in the course project description
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# "ON-ROAD" emissions, assuming that defines "Motor Vehicle" emissions
NEIBaltimoreOnRoad <-  
    NEI %>% 
    filter(fips == "24510") %>% 
    filter(type == "ON-ROAD") %>%  
    group_by(year) %>% 
    summarize(YearlyEmissionsInTons = sum(Emissions))

# Plot5: Motor Vehicle emissions by year in Baltimore
png("plot5.png")
plot(NEIBaltimoreOnRoad, 
     main = "Total Motor Vehicle PM2.5 emissions in Baltimore",
     col=2, cex=3, pch=20, type="b")
dev.off()
