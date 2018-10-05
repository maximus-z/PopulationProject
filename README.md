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
1. To load initial raw data into DB via external tables (/county_ext.sql).
