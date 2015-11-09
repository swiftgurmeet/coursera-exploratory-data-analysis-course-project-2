# Packages "dplyr" and "ggplot2" are assumed to be installed.
# The input data files are assumed to be in the working directory.
# dplyr chaining is used frequently in the code using %>%

library(dplyr)
library(ggplot2)

# Read the input data as suggested in the course project description
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Use dplyr chaining to get total emissions by year
NEIYearlyEmissions <- 
    NEI %>% 
    group_by(year) %>% 
    summarize(YearlyEmissionsInTons = sum(Emissions)) %>% 
    mutate(YearlyEmissionsInTons = YearlyEmissionsInTons)

# Plot1: Total emissions by year
png("plot1.png")
plot(NEIYearlyEmissions, 
    xlab = "Year",
    ylab = "Emissions in Tons",
    main = "Total PM2.5 Emissions in United States",
    col = 2, cex=3, pch=20, type="b")
dev.off()
