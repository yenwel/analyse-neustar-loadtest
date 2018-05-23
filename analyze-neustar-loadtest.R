library(DBI)
# Connect to my-db as defined in ~/.my.cnf
con <- dbConnect(RMySQL::MySQL(),
                 user="root", password="",
                 dbname="loadtestrslt", host="localhost" )

dbListTables(con)
dbWriteTable(con, "loadtestrslt", loadtestrslt)
dbListTables(con)

dbListFields(con, "parent_load_test_info")
dbReadTable(con, "parent_load_test_info")

# You can fetch all results:
res <- dbSendQuery(con, "select plti.test_name,p.phase_number, p.is_ramp, o.*,t.* /* count(*)*/
  from loadtestrslt.`object` as o 
                   inner join loadtestrslt.parent_load_test_info as plti on (o.test_region_id = plti.test_region_id)
                   inner join loadtestrslt.tx as t on (o.tx_id  = t.tx_id and o.test_region_id = t.test_region_id)
                   inner join loadtestrslt.phases as p on (p.phase_number = t.phase_number and p.test_region_id = t.test_region_id);")


data <- dbFetch(res,13148104)
# Clear the result
dbClearResult(res)

dbDisconnect(con)

#write.csv(data,"data.csv")

as.factor(data$test_name) -> data$test_name
as.factor(data$domain) -> data$domain
as.factor(data$path) -> data$path
as.character(data$path) -> data$path

library(lattice) 

#bwplot(test_name ~ time_to_first_byte, data  )


bwplot(test_name ~ time_to_first_byte  | domain , data  )

data2 <- data[data$domain == "nieuwsblad.be",] 

bwplot(test_name ~ time_to_first_byte  | path , data2  )

library(plyr)

data2$pathsplit <- strsplit(data2$path,"/")

data2 <- cbind(data2,ldply(data2$pathsplit, rbind) )

colnames(data2)[54:64] <- paste0(rep("path", 11), 1:11)

bwplot(test_name ~ time_to_first_byte  | path2  , data2  )


