library(RSQLite)
library(DBI)
library(mongolite)
library(jsonlite)
library(data.table)
library(tidyverse)

# set the directory where your .sqlite file is present.
con <- dbConnect(SQLite(),'FPA_FOD_20170508.sqlite')

dbListTables(con)

fires <- dbReadTable(con,'Fires')
fires <- data.table::setDT(fires)
nrow(fires)

#Create a db named Project & collection named fires in mongo db manually before executing
#below commands.

my_collection = mongo(collection = "fires", db = "Project")
fires$Shape <- NULL
my_collection$insert(fires)
my_collection$count()