install.packages("ggmap")
devtools::install_github("hadley/httr", force= TRUE)
devtools::install_github("DataWookie/UbeR")
library(ubeR)
install.packages("tidyverse")
library(tidyverse)

UBER_CLIENTID <- "g5Q5EnwUZtu8CXVzjSt2g"
UBER_CLIENTSECRET <- "6MY9K4JXATQqIDN3iAiIeFzKwB"

uber_oauth(UBER_CLIENTID, UBER_CLIENTSECRET)
me <- uber_me()
names(me)
cat("My Uber Profile:",me$first_name, me$last_name)
history <- uber_history(50, 0)
uber_places_get("home")
uber_places_get("work")
history <- uber_history()
names(history)