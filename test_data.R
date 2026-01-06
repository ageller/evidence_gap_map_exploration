library(tidyverse)
library(stringr)

logic_converter <- function(x) {
  # Only act on character vectors
  if (!is.character(x)) return(x)
  x_new <- x
  x_new[x == "Yes"] <- TRUE
  x_new[x == "No"]  <- FALSE
  return(x_new)
}

batch3_df <- read_csv("EGM_Shiny/data/examples/batch3_resolved.csv") %>%
  distinct(Phase, Assignment, Directory, .keep_all = TRUE) %>% #!!! THIS NEEDS TO BE UPDATED
  mutate(internal_id = row_number()) 


# create a new dataframe that can be used for the egm plot
batch3_egm_counts <- batch3_df %>%
  mutate(
    WorkType = replace_na(WorkType, "None Given"),
    Theme.Assignment = replace_na(Theme.Assignment, "None Given"),
  ) %>%
  count(WorkType, Theme.Assignment) %>%
  mutate(
    WorkType = fct_relevel(factor(WorkType), "None Given", "Other"),
    Theme.Assignment = fct_relevel(factor(Theme.Assignment),  "None Given", "Other")
  )

