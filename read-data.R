
# load packages -----------------------------------------------------------

library(tidyverse)
library(auk)


# save stage commit push 


# do stuff ----------------------------------------------------------------

# path to the ebird data file, here a sample included in the package
# get the path to the example data included in the package
# in practice, provide path to ebd, e.g. f_in <- "data/ebd_relFeb-2018.txt
f_in <- "data/White Collared Manakin/ebd_BR-MS-027_whcman1_smp_relDec-2024.txt"
# output text file
f_out <- "ebd_filtered_whcman1.txt"
ebird_data <- f_in %>% 
  # 1. reference file
  auk_ebd() %>% 
  # 2. define filters
  auk_species(species = "Canada Jay") %>% 
  auk_country(country = "Canada") %>% 
  # 3. run filtering
  auk_filter(file = f_out) %>% 
  # 4. read text file into r data frame
  read_ebd()
