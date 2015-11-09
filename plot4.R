# Packages "dplyr" and "ggplot2" are assumed to be installed.
# The input data files are assumed to be in the working directory.
# dplyr chaining is used frequently in the code using %>%

library(dplyr)
library(ggplot2)

# Read the input data as suggested in the course project description
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Data by "Coal Combustions" categories 
coalcategories <- SCC[grep("[Cc]omb.*[Cc]oal", SCC$Short.Name),"SCC"]
NEICoal <- NEI[which(NEI$SCC %in% coalcategories),]

# Coal Combustion data by year
NEICoalByYear <- 
    NEICoal %>% 
    group_by(year) %>% 
    summarize(YearlyEmissionsInTons = sum(Emissions))

# Plot4: Coal combustion by year
png("plot4.png")
plot(NEICoalByYear, col=2, cex=3, pch=20, type="b")
dev.off()
