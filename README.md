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
The idea is to keep data on the smallest level and it's requered aggreagate it.

## Technical details of implimentation
The solution could be implemented in many different ways - using Python and Panda library, PostgreSQL and AWS or GCP.
I used Oracle DB because of my primary skillset.
Star schema dimensional approach was implemented where's one fact table in centre and set of dimensions are around.
The flow is following:
1. To load initial raw data into DB via [external tables](/External%20tables).
- As a prerequiste for using external tables [SOURCELOAD directory](/Directories/sourceload_dir.sql) should be created.
2. Build three dimensions - [county dimension](/Tables/dim_county.sql), [state dimension](/Tables/dim_state.sql) and [metropolitan dimension](Tables/dim_metropolitan.sql) and one [fact table](/Tables/fact_population.sql).
3. Create [packages](/Packages) to maintanance data load into dimesnions and fact tables.
4. Two reports as views - [population of any major metropolitan area in the US over time](/Views/total_population_by_metropolitan_view.sql) and [population and unemployment rates of the US
at the county level](/Views/total_unempoyed_by_county_view.sql).

## How you can get data for the project
### US population at county level.
1. Go to [Census web site](https://factfinder.census.gov/bkmk/table/1.0/en/PEP/2017/PEPANNRES/0100000US.05000.003) and check if you see US population at county level from 2010 to 2017.
2. Push “Download” button and uncheck “Merge the annotations and data into a single file?” and “Include descriptive data element names?”
3.	Unzip PEP_2017_PEPANNRES.zip file and copy PEP_2017_PEPANNRES.csv file to the folder that is linked to your [Oracle directory](/Directories/sourceload_dir.sql). /home/sourceload folder on Unix macjine in my case.
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
1. 
