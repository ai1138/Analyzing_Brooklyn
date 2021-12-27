 

[Moving to Brooklyn Paper](https://medium.com/@ai1138/moving-to-brooklyn-8b6748fffcc5)



Folder structure:
data_ingest - contains the steps we took to ingest the file to HDFS after downloading the datasets from online sources

etl_code - contains the MapReduce programs we all wrote independently to clean our giant data files of certain columns that we did not need.

profiling_code - the way we created the Hive tables to store the data correctly. Also, the way we used HiveQL to organize and group the data by zipcode in preparation for joining.

test_code - all kinds of testing and trialing we did to understand how we can best organize our data by zipcode. We experimented in various ways to get the most relevant information from our data. This testing can be seen in this folder.

screenshots - screenshots of the steps we took to create our cleaned and organized datasets

Running the code:
First, all the files must be found on the local directory or HDFS. Then it is necessary to create the Hive tables to store the files then use copyFromLocal to move these files into the Hive table. Then we must use the Hive commands to organize the data by zip code as shown in the profiling_code folder. Finally, we must run the Hive command to join all the new tables together into one final table. This table will be used for our analytic. All analyis can be done on this new table through Hive. 

To create the final analytic first follow the Ingestion-Abed Islam.txt to load all the data accordingly. Then look at the queriesToCreateAnalytic.hql file. Run the file in the exact order the queries are in. It will first create all the tables. Then the table 
energyCleaned will create the profiled table Abed needs. The table energyCrisis is a join between Abed and Sheika's table(crashes and enery). Then with energyCrisis it is joined in with Afnan table which creates the analytic table.
