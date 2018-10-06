# PopulationProject
## Task

>1) You are working with an analyst that would like to be able to graph the population of
any major metropolitan area in the US over time. Annual estimates are sufficient for this
customer.
>2) A different analyst wants to know about population and unemployment rates of the US
at the county level. Annual estimates are sufficient for this customer.

## Solution explanation
In original requarements we can see that two difeerent reports work on two different granularity levels.
County area is a smaller one and a Metropolitan area is a greater one.
The idea is to keep data on the smallest level and if it's requered aggreagate it.

## Technical details of implimentation
The solution could be implemented in many different ways - using Python and Panda library, PostgreSQL and AWS or GCP.
I used Oracle DB because of my primary skillset.
Star schema dimensional approach was implemented where's one fact table in centre and set of dimensions are around.
The flow is following:
1. To load initial raw data into DB via [external tables](/External%20tables).
- As a prerequiste for using external tables [Oracle directory](/Directories/sourceload_dir.sql) should be created.
2. Build three [SCDII type](https://en.wikipedia.org/wiki/Slowly_changing_dimension#Type_2:_add_new_row) dimensions - [county dimension](/Tables/dim_county.sql), [state dimension](/Tables/dim_state.sql) and [metropolitan dimension](Tables/dim_metropolitan.sql) and one [fact table](/Tables/fact_population.sql).
3. Create [packages](/Packages) to maintanance data load into dimesnions and fact tables.
4. Two reports as views - [population of any major metropolitan area in the US over time](/Views/total_population_by_metropolitan_view.sql) and [population and unemployment rates of the US
at the county level](/Views/total_unempoyed_by_county_view.sql).

## How you can get data for the project
### US population at county level.
1. Go to [Census web site](https://factfinder.census.gov/bkmk/table/1.0/en/PEP/2017/PEPANNRES/0100000US.05000.003) and check if you see US population at county level from 2010 to 2017.
2. Push “Download” button and uncheck “Merge the annotations and data into a single file?” and “Include descriptive data element names?”
3.	Unzip PEP_2017_PEPANNRES.zip file and copy PEP_2017_PEPANNRES.csv file to the folder that is linked to your [Oracle directory](/Directories/sourceload_dir.sql). /home/sourceload folder on Unix box in my case.
4. You can also use file that is [already downloaded](/Data%20files/Population.csv).

### Unemployment population at county level.
1. Go to [Bureau of Labor Statistics](https://www.bls.gov/lau/) site and download as many txt files as you need. I downloaded 7 files from [2010](https://www.bls.gov/lau/laucnty10.txt) to [2017](https://www.bls.gov/lau/laucnty17.txt) years.
2. You can also use file that is [already downloaded](/Data%20files/laucnty10.txt).

### Geography reference data about counties and Metropolitan areas.
1. List of [US counties](https://www2.census.gov/programs-surveys/popest/geographies/2017/all-geocodes-v2017.xlsx).
Should be converted into [csv](/Data%20files/County.csv).
2. List of [US states](https://www2.census.gov/programs-surveys/popest/geographies/2017/state-geocodes-v2017.xlsx).
Should be converted into [csv](/Data%20files/State.csv).
3. List of [Metropolitan divisions](https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2018/delineation-files/list1.xls).
Should be converted into [csv](/Data%20files/Metropolitan.csv).

## How to release project
1. You need to define folder on Oracle server where you will keep data files. _/home/sourceload_ folder on Unix box in my case.
2. Create [Oracle directory](/Directories/sourceload_dir.sql) using your folder as an patch in your script.
3. Copy [all data files](/Data%20files) that were downloaded previously into folder on Oracle server.
4. Create [external tables](/External%20tables).
5. Create [dimensions, fact table and their constraints](/Tables).
6. Create [sequences](/Sequences/sequences.sql) and [index](/Indexes).
7. Create [packages](/Packages) and [views](/Views).
8. Run [final script](/run.sql) to populate all tables.
9. Check [population of any major metropolitan area in the US over time view](/Views/total_population_by_metropolitan_view.sql) and [population and unemployment rates of the US at the county level view](/Views/total_unempoyed_by_county_view.sql).
10. Enjoy! :-)

## Examples
#### _Final fact table_

| YEAR | STATE_SK | COUNTY_SK | TOTAL_QTY | FORCE_QTY | EMPLOYED_QTY | UNEMPLOYED_QTY | CREATED_ON | CREATED_BY |
| ---- | -------- | --------- | --------- | --------- | ------------ | -------------- | ---------- | ---------- |
| 2013 | 31 | 287 | 52923 | 23687 | 21822 | 1865 | 05-OCT-18 | Maximus |
| 2014 | 31 | 287 | 52541 | 23454 | 21752 | 1702 | 05-OCT-18 | Maximus |
| 2015 | 31 | 287 | 52207 | 23461 | 21900 | 1561 | 05-OCT-18 | Maximus |
| 2016 | 31 | 287 | 52049 | 23580 | 22089 | 1491 | 05-OCT-18 | Maximus |
| 2017 | 31 | 287 | 51909 | 23066 | 21966 | 1100 | 05-OCT-18 | Maximus |
| 2010 | 31 | 288 | 658048 |318520 |285627 | 32893 | 05-OCT-18 | Maximus |
| 2011 | 31 | 288 | 657789 |319652 | 289916 | 29736 | 05-OCT-18 | Maximus |
| 2012 | 31 | 288 | 657668 | 316511 | 293020 | 23491 | 05-OCT-18 | Maximus |

#### _Population of any major metropolitan area in the US over time view_

| YEAR | METRPLRN_NAME | TOTAL_QTY|
| ---- | ------------- | -------- |
| 2010 | Albany-Schenectady, NY | 1168972 |
| 2011 | Albany-Schenectady, NY | 1169575 |
| 2012 | Albany-Schenectady, NY | 1171161 |
| 2011 | Albuquerque-Santa Fe-Las Vegas, NM | 1157494 |
| 2014 | Albuquerque-Santa Fe-Las Vegas, NM | 1161927 |
| 2010 | Amarillo-Borger, TX | 274884 |
| 2013 | Amarillo-Borger, TX | 280741 |
| 2014 | Appleton-Oshkosh-Neenah, WI | 400890 |
| 2010 | Asheville-Brevard, NC | 458423 |
| 2012 | Asheville-Brevard, NC | 463997 |

#### _Population and unemployment rates of the US at the county level_

| YEAR | COUNTY_NAME | TOTAL_QTY | UNEMPLOYED_RATIO |
| ---- | ----------- | --------- | ---------------- |
| 2010 | Abbeville County | 25328 | 13.6 |
| 2011 | Abbeville County | 25082 | 12.46 |
| 2012 | Abbeville County | 25019 | 10.62 |
| 2010 | Acadia Parish | 	61859 | 7.26 |
| 2011 | Acadia Parish | 	61826 | 6.68 |
| 2012 | Acadia Parish | 61984 | 5.98 |
| 2010 | Accomack County | 33147 | 7.89 |
| 2011 | Accomack County | 33222 | 8.4 |
| 2012 | Accomack County | 33264 | 7.88 |
| 2013 | Accomack County | 32963 | 7.22 |
| 2014 | Accomack County |32965 | 6.7 |

## Outstanding items.
1. Add audit for dataloading.
2. Configure some BI tool like Tableau to have a nice dashbord and reports.
3. Reapeat the same flow on AWS, GCP and Python.
