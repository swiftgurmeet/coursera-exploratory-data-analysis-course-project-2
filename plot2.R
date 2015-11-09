# Packages "dplyr" and "ggplot2" are assumed to be installed.
# The input data files are assumed to be in the working directory.
# dplyr chaining is used frequently in the code using %>%

library(dplyr)
library(ggplot2)

# Read the input data as suggested in the course project description
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Yearly emissions by year for Baltimore
NEIYearlyEmissionsBaltimore <- 
    NEI %>% 
    filter(fips == "24510") %>% 
    group_by(year) %>% 
    summarize(YearlyEmissionsInTons = sum(Emissions))

#Plot2: Baltimore total emissions by year
png("plot2.png")
plot(NEIYearlyEmissionsBaltimore, col=2, cex=3, pch=20, type="b")
dev.off()
