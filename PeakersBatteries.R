######################################################################
######### Climate Central Peakers and Batteries Project ##############
################# Code by Joan Meiners, May 2020 #####################
######################################################################

# load libraries
library(dplyr)
library(plyr)

setwd("/Users/joanmeiners/Dropbox/FreelanceWriting/Climate Central/PeakersBatteries/Peaker Plant data from EIA/Edited data/")

# load and view data
F923_4 = read.csv("EIA923_2018_Page4GeneratorData.csv", header = TRUE)
F860 = read.csv("eia860_3_1_2018.csv", header = TRUE)
View(F923_4)
dim(F923_4)
View(F860)
dim(F860)

# create a unique identifier for generator data
F923_4$UniqueID = paste(F923_4$OperatorID, F923_4$PlantID, F923_4$GeneratorID)
dim(F923_4)

F860$UniqueID = paste(F860$OperatorID, F860$PlantID, F860$GeneratorID)
dim(F860)

# join two datasets by UniqueID new column
subplants = plyr::join(F923_4, F860, by = "UniqueID")
dim(subplants)
View(subplants)

# reorganize
subplants = subplants[c("OperatorName", "PlantName","PlantState", "County", "OperatorID", "PlantID", "GeneratorID", "UniqueID", "NetGeneration2018", "NameplateCapacityMW", "Technology", "EnergySource1", "Status", "OperatingMonth", "OperatingYear", "PlannedRetirementMonth", "PlannedRetirementYear")]
dim(subplants)
View(subplants)

# convert NamplateCapacityMW to numeric
class(subplants$NameplateCapacityMW)
subplants$NameplateCapacityMW = as.character(subplants$NameplateCapacityMW)
subplants$NameplateCapacityMW = as.numeric(subplants$NameplateCapacityMW)

## convert NetGeneration2018 to numeric
class(subplants$NetGeneration2018)
subplants$NetGeneration2018 = as.character(subplants$NetGeneration2018)
subplants$NetGeneration2018 = as.numeric(gsub(",", "", subplants$NetGeneration2018))

# create CapcityFactor column using calculation
subplants$CapacityFactor = 100*(subplants$NetGeneration2018/((subplants$NameplateCapacityMW)*8760))
summary(subplants$CapacityFactor)

dim(subplants)

# save file
write.csv(subplants, "subplants.csv")

# create another dataframe that is just peakers (Capacity Factor < 5)
peakers5 = subset(subplants, CapacityFactor < 5 & CapacityFactor > -0.000001)
dim(peakers5)

write.csv(peakers5, "peakers5.csv")

# create another dataframe that is just peakers (Capacity Factor < 10)
peakers10 = subset(subplants, CapacityFactor < 10 & CapacityFactor > -0.000001)
dim(peakers10)

write.csv(peakers10, "peakers10.csv")
