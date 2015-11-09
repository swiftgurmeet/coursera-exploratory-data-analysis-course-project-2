# Packages "dplyr" and "ggplot2" are assumed to be installed.
# The input data files are assumed to be in the working directory.
# dplyr chaining is used frequently in the code using %>%

library(dplyr)
library(ggplot2)

# Read the input data as suggested in the course project description
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Total emissions by year and type for Baltimore
NEIYearlyEmissionsBaltimoreByType <- 
    NEI %>% 
    filter(fips == "24510") %>% 
    group_by(year,type) %>% 
    summarize(YearlyEmissionsInTons = sum(Emissions))

# Plot3: Plot Baltimore emissions by year across 4 "by type" facets in a ggplot panel.
ggplot(NEIYearlyEmissionsBaltimoreByType, aes(year,YearlyEmissionsInTons)) + geom_point() + geom_line() + facet_grid(. ~ type) +
                                                                             labs(title = "Total PM2.5 emissions in Baltimore by Type")
ggsave("plot3.png", width=8, height=4, dpi=100)
