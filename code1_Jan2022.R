## Multiple datasets
library(tidyverse)
dat1 <- read_csv("D1_Osuri_Sanakran_2016_JAE_plot_data.csv")
dat2 <- read_csv("D2_SahaTilakDavidar_Andaman1992-3_data.xlsx")
dat3 <- read_csv("D3_Surendra_Osuri_Ratnam_2021_FEM_plotdata.csv")

d4.1 <- read_table("FI_data_set/Macroplot_data_Rev.txt")
d4.2 <- read_table("FI_data_set/Site_variables.txt")
d4.3 <- read_table("FI_data_set/Species_list.txt")
dat4 <-
  left_join(x = d4.1,
            y = d4.3 %>% select(SpCode,Name,Author) %>% rename(Genus=Name,Species=Author),
            by = "SpCode") %>%
  left_join(x = ., y = d4.2, by = "PlotID")
