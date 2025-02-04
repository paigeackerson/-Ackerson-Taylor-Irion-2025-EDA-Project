
# load packages -----------------------------------------------------------

library(tidyverse)
library(auk)
library(magrittr)


# save stage commit push 


# do stuff ----------------------------------------------------------------

# path to the ebird data file, here a sample included in the package
# get the path to the example data included in the package
# in practice, provide path to ebd, e.g. f_in <- "data/ebd_relFeb-2018.txt
f_in <- "data/ebd_CR_whcman1_smp_relDec-2024/ebd_CR_whcman1_smp_relDec-2024.txt"

# output text file
f_out <- "ebd_filtered_whcman1.txt"
ebird_data <- 
  f_in |> 
  # 1. reference file
  auk_ebd() |>

  # 2. define filters
  auk_species(species = "Manacus candei") |>
  auk_country(country = "Costa Rica")  |>

  auk_distance(distance = c(0,2)) |>


  auk_protocol(protocol = c("Stationary", "Traveling")) |>


  auk_time(start_time = c("06:00", "18:00")) |>
  auk_complete() |>
  # 3. run filtering
  auk_filter(file = f_out, overwrite=TRUE) |>

  # 4. read text file into r data frame
  read_ebd()

  