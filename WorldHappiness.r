getwd()

# setwd("penguin/Desktop/projects/")
# getwd()
setwd("Kaggle Datasets/world-happiness-report")
getwd()

# Get Libraries

library(plyr)                   # Data Manipulation
install.packages("dplyr")
library(dplyr)                  # Data Manipulation
library(ggplot2)                # Data Visualisation
install.packages("plotly")
library(plotly)                 # Dynamic Data Visualisation


# World Happiness Report for 2015, 2016 and 2017 is available.

report_15 <- read.csv("2015.csv", na.strings = c(""))
head(report_15, 5)

report_16 <- read.csv("2016.csv", na.strings = c(""))
head(report_16, 5)

report_17 <- read.csv("2017.csv", na.strings = c(""))
head(report_17, 5)
colnames(report_15)

tail(report_15)
str(report_15)
summary(report_15)

# Checking for NA in all the 3 data sets
report_15[!complete.cases(report_15),]

report_16[!complete.cases(report_16),]

report_17[!complete.cases(report_17),]

install.packages("magrittr")
library(magrittr)

# Create a separate Table to comparing the Happiness Ranks for all the years 

colnames(report_15)
colnames(report_16)
colnames(report_17)

Happiness_Rank <- merge(report_15[, c(1, 3)], 
                        report_16[, c(1, 3)],
                        by.x = "Country", 
                        by.y = "Country")

head(Happiness_Rank, 5)
colnames(Happiness_Rank) <- c("Country", "Happiness Rank 2015",
                              "Happiness Rank 2016")

Happiness_Rank <- merge(Happiness_Rank, 
                                 report_17[, c(1,2)], 
                                 by = "Country")

head(Happiness_Rank, 3)
colnames(Happiness_Rank) <- c("Country", "Happiness Rank 2015",
                              "Happiness Rank 2016", "Happiness Rank 2017")

head(Happiness_Rank, 3)

Happiness_Rank$RankChange2016 <- (Happiness_Rank$`Happiness Rank 2015` - 
                                  Happiness_Rank$`Happiness Rank 2016`)
head(Happiness_Rank, 3)

Happiness_Rank$RankChange2017 <- (Happiness_Rank$`Happiness Rank 2016` - 
                                    Happiness_Rank$`Happiness Rank 2017`)


head(Happiness_Rank, 3)


# Format the Happiness Rank DataFrame

install.packages("formattable")

library(formattable)

formattable(Happiness_Rank,
            list(RankChange2016 = formatter("span", 
              style = RankChange2016 ~ style(color = ifelse(RankChange2016 < 0, "red", "green"))), 
              RankChange2017 = formatter("span",
              style = RankChange2017 ~ style(color = ifelse(RankChange2017 < 0, "red", "green")))))
              


# Use TreeMap to showcase top 20 

library(magrittr)
library(dplyr)
?dplyr::filter()
?dplyr::arrange()

HappinessRank_top20 <- filter(Happiness_Rank, Happiness_Rank$`Happiness Rank 2015` <= 20)

HappinessRank_top20 <- dplyr::arrange(HappinessRank_top20, desc(HappinessRank_top20$`Happiness Rank 2015`))

HappinessRank_top20



# Using size for a discrete variable is not advised. 
# 

# Happiness Score relation to Health. Life Expectancy -  top 10 and bottom 10
# Happiness Score relation to Freedom - top 10 and bottom 10
# Happiness Score relation to Trust.Government Corruption - top 10 and bottom 10
# Happiness Score relation to Generocity - top 10 and bottom 10

# Countries with Max and Min corruption
# Mapping of contries with Economy
# Happiest countries Ranking through 2015, 2016 and 2017
# Region mapping with Happiness index

# Reasons why Countries some countries are happier then others.
