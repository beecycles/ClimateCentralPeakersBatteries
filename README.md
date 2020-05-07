# ClimateCentralPeakersBatteries
Data and code for a journalism project with Climate Central on peaker power plants and battery storage

Description of files:

**_Data from EIA used to create peaker summaries:_**   
  
>  **EIA923_2018.csv** = The first tab of the EIA923_Schedules_2_3_4_5_M_12_2018_Final_Revision.xlsx file from https://www.eia.gov/electricity/data/eia923/  
>  **EIA923_2018_Page4GeneratorData.csv** = The page 4 tab from the EIA923_Schedules_2_3_4_5_M_12_2018_Final_Revision.xlsx file from https://www.eia.gov/electricity/data/eia923/. This tab has generator-level data for Net Generation  
>  **eia860_3_1_2018.csv** = The first tab of the 3_1_Generator_Y2018.xlsx file from https://www.eia.gov/electricity/data/eia860/  

_**Code files:**_  
  
>  **PeakersBatteries_generators.R** = code to join 2018 data for net generation and nameplate capacity at the generator level (only reported for a subset of plants, so this data/code does not include all possible peakers). See generators_formatted.csv for a formatted version of this database.  
>  **PeakersBatteries_plants.r** = code to join 2018 data for net generation and nameplate capacity for ALL PLANTS, which means first summarizing the nameplate capacity and net generation values per plant before calculating capacity factor. This data/code includes all plants that report data to the EIA but does not include any detail at the generator level. See allplants_formatted.csv for a formatted version of this database.  
  
_**Created data:**_  
  
>  **generators.csv** = database created using the PeakersBatteries_generators.R code above that shows the 
