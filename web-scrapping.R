# here, it is used "selector gadget" chrome extension for selecting one or multiple columns.

install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(dplyr)
url <- "https://fbref.com/en/countries/"
page <- read_html(url)
countries <- page %>% html_nodes("th.left") %>%  html_text()
countries
governing_body <- page %>% html_nodes(".left.poptip") %>%  html_text()
governing_body
ds <- data.frame(countries, governing_body)
write.csv(ds,"ok.csv",row.names=FALSE)
