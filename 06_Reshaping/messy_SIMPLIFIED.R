# Script Objectives ----
# Synthesize all of the amphibian data from National Parks by
# merging inconsistently formatted biodiversity data from 
# several raw data files

# Load Packages ----
library(dplyr)
library(tidyr)

# Process and combine all data files ----
data_complete <- read.delim("ACAD.txt") %>%
  # 1. variable names to lower case
  rename_with(tolower) %>%
  # 2. create record_id variable
  unite(record_id, c(record, id), sep = "-") %>%
  # 3. fill missing order and family values
  fill(order, family) %>%
  # 4. bind with original data
  bind_rows(read.delim("data.txt") %>%
              # 1. filter to only include approved amphibian data
              filter(category == "Amphibian", record_status == "Approved")) %>%
  # 5. bind with redwood biodiversity data
  bind_rows(read.delim("REDW_records.txt") %>%
              # 1. pivot from wide to long layout
              pivot_longer(cols = -record_id, names_to = "scientific_name", values_to = "oasr") %>%
              # 2. drop rows with NAs
              drop_na() %>%
              # 3. separate oasr into four variables
              separate(oasr, into = c("occurrence", "abundance", "seasonality", "record_status"), sep = '-') %>%
              # 4. change "NA" to NA in abundance, occurrence, and record_status and
              mutate(abundance = na_if(abundance, "NA"),
                     occurrence = na_if(occurrence, "NA"),
                     record_status = na_if(record_status, "NA")) %>%
              # 5. replace . with a space in the scientific_name column
              mutate(scientific_name = gsub(pattern = "\\.", replace = " ", scientific_name)) %>%
              # 6 join with redwood_species
              left_join(read.delim("REDW_species.txt"))) %>%
  # 6. join with park details
  left_join(read.delim("parks_updated.txt"))

glimpse(data_complete)
