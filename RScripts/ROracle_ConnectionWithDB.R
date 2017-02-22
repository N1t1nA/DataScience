# Download binary from oracle: http://www.oracle.com/technetwork/database/database-technologies/r/roracle/downloads/index.html
# The run the following command in r, substituting the file path:
# setwd("D:/4TMR542/Softwares/ROracle")
# # set to path of download
# install.packages("ROracle_1.2-1", repos = NULL)
#Then load the library and use the package - you may have to change XXXX to whatever is in your TNS Names:
library('ROracle')
drv <- dbDriver("Oracle")
# NOTE: never store passwords in a saved script!!
con <- dbConnect(drv, "PROD", "XXXX", dbname='DEV')
#test connection:
dbReadTable(con, "IA_LOG")
IA<-dbSendQuery(con, 'select * from IA_LOG')
#List all Tables
dbListTables(con)
# fetch all results from the emp table 
res <- dbGetQuery(con, "select * from IA_LOG")
# dbSendQuery can be used to fetch data in chunks # as well as all of data at once 
res <- dbSendQuery(con, "select * from IA_LOG")
# fetch all results 
fetch(res)
# or a chunk at a time 
fetch(res, n = 5)
# describing the schema for the emp table using dbGetInfo 
dbGetInfo(res, what = 'fields')
# clear the result 
dbClearResult(res)
dbGetInfo(drv)
dbGetInfo(con)
dbGetInfo(res)
# disconnect from the database 
#dbDisconnect(con)
# free the driver object 
#dbUnloadDriver(drv)