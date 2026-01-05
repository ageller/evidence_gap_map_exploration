library(tidyverse)

logic_converter <- function(x) {
  # Only act on character vectors
  if (!is.character(x)) return(x)
  x_new <- x
  x_new[x == "Yes"] <- TRUE
  x_new[x == "No"]  <- FALSE
  return(x_new)
}

batch3_df <- read_csv("EGM_Shiny/data/examples/batch3_resolved.csv") %>%
    filter(InclusionDecision == "Include") %>%
    distinct(Phase, Assignment, Directory, .keep_all = TRUE) %>% 
    mutate(internal_id = row_number())
    

cols <- names(batch3_df)


batch3_egm_counts <- batch3_df %>%
  count(WorkType, Theme.Assignment)