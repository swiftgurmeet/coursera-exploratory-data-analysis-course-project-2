# Packages "dplyr" and "ggplot2" are assumed to be installed.
# The input data files are assumed to be in the working directory.
# dplyr chaining is used frequently in the code using %>%

library(dplyr)
library(ggplot2)

# Read the input data as suggested in the course project description
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get combined data for Baltimore and Los Angeles for Motor Vehicles by year
NEIBaltimoreAndLosAngelesOnRoad <-  
    NEI %>% 
    filter(fips == "06037" | fips == "24510") %>% 
    filter(type == "ON-ROAD") %>%
    mutate(region = ifelse(fips == "06037", "Los Angeles","Baltimore")) %>%
    group_by(year,region) %>% 
    summarize(YearlyEmissionsInTons = sum(Emissions))

# Plot6: Use qplot to simultaneously plot Baltimore and Los Angeles Motor Vehicle data by year and coded by color
qplot(year,YearlyEmissionsInTons, data = NEIBaltimoreAndLosAngelesOnRoad, color = region, geom="line")
ggsave("plot6.png", width=8, height=4, dpi=100)