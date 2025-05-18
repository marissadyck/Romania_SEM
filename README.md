---
output:
  html_document: default
  pdf_document: default
---
# OSM_2022-2023
This repository contains data, R scripts, and other materials for a structural equation modeling (SEM) analysis of camera trap images in Romania associated with the publication below:  

Dyck, M.A., Iosif, R., Promberger–Fürpass, B. and Popescu, V.D., 2025. Dracula's Menagerie Reloaded: Assessing the Relative Roles of Habitat and Interspecific Interactions in an Intact Mammalian Assemblage Using Structural Equation Modeling. *Ecology and Evolution*, 15(4), p.e71381.  

[Link to publication](https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.71381)


<hr>

### GENERAL INFORMATION

**Project Information**   
This work was conducted in collaboration with Foundation Conservation Carpathia (FCC) a non-government organization (NGO) in Romania with a mission to create a resilient Carpathian ecosystem where biodiversity and people thrive in perpetuity. Learn more about FCC their projects and their mission [here](https://www.carpathia.org/about/).    


**Author Information:**  
Corresponding Author Contact Information  
		Name: Marissa A. Dyck  
		Institution: University of Victoria   
		Address: 3800 Finnerty Rd, Victoria, BC V8P 5C2   
		Email: [marissadyck@uvic.ca](mailto:marissadyck@uvic.ca)     

**Date of data collection:** 2018-2019

**Geographic location of data collection:** Southern Carpathians, Romania


### DATA & FILE OVERVIEW

**File List:**  

*Files in main folder*
		
* <span style = "color: #7B0F17;">**Romania_SEM.Rproj**</span>; R project to run code for data cleaning and analyses   
* <span style = "color: #7B0F17;">**README**</span>; this README file with various extensions for viewing (.html, .pdf) and editing (.md)


**Note about file extensions**  

The scripts and several other files in this repository are .r, .rmd or .md files which are written in RStudio using R programming language. If you are not familiar with R or want to see an overview of any of the files you can view either the .html (open in a web browser) or .pdf files instead of the R files (this will still show you the code that was run as well as the outputs but will not require you to use R). 


*Files in data folder*

*/processed*  
This folder includes data that has been cleaned and reformatted using scripts within this repository.

* <span style = "color: #7B0F17;">**ro_sem_dat_effort_2018-2019.csv**</span>;  contains detection data for animals seen on the camera traps, camera effort, and landscape/environmental covariates used in the analysis, formatted for the [piecewiseSEM package](https://cran.r-project.org/web/packages/piecewiseSEM/index.html) 



*/raw*  
This folder includes raw animal detections, camera trap details, and environmental/landscape covariate data-extracted using GIS separately.   

* <span style = "color: #7B0F17;">**animals_on_cameras_2018-2019.csv**</span>; contains raw detection data for the animals seen on the cameras  

* <span style = "color: #7B0F17;">**cams_data_autumn_2018-2019.csv**</span>; contains raw landscape covariates for each camera site deployed in the autumn monitoring season 

* <span style = "color: #7B0F17;">**cams_data_winter_2018-2019.csv**</span>; contains raw landscape covariates for each camera site deployed in the winter monitoring season   

* <span style = "color: #7B0F17;">**Trap_Effort_S2.csv**</span>; contains raw data of the number of active days for each camera in each 2-week occasion period for the second season (winter) of monitoring   

* <span style = "color: #7B0F17;">**Trap_Effort_S3.csv**</span>; contains raw data of the number of active days for each camera in each 2-week occasion period for the third season (autumn) of monitoring    



*Files in relevant literature folder* 

This folder contains files that may be relevant for understanding the analysis. 

* <span style = "color: #7B0F17;">**piecewiseSEM.pdf**</span>; Overview of the piecewiseSEM package (R package used for this analysis) 

* <span style = "color: #7B0F17;">**Land_cover_codes.pdf**</span>; Document that provides definitions for the CORIUNE Land Cover classification nomenclature, which was used to define our forest explanatory variable


*Files in scripts folder* 

This file contains the various scripts needed for data formatting, visualization, and analysis.   

* <span style = "color: #7B0F17;">**1_RO_SEM_data_formatting**</span>; .rmd file and knitted .html/.pdf files with code for data cleaning and formatting     

* <span style = "color: #7B0F17;">**2_RO_SEM_summary_stats**</span>; .rmd file and knitted .html/.pdf files with code for summary statistics and data analysis checks (e.g., pearson's correlation between covariates)


* <span style = "color: #7B0F17;">**3_RO_SEM_analysis**</span>; .R script file with code for conducting piecewise structural equation models (SEM) analysis 


## RAW DATA   

### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;"> animals_on_cameras_2018-2019.csv</span>]  

* **Number of variables/columns:** 24
* **Number of observations/rows:** 6,621

**Variable List:**

* <span style = "color: #2274A5;">**Sort**</span>, integer used to order/sort the data for internal purposes    

* <span style = "color: #2274A5;">**Session**</span>, factor referring to which monitoring session the data belong to (1 = pilot session, 2 = winter session, 3 = autumn session) 

* <span style = "color: #2274A5;">**GMU**</span>, character entries 

* <span style = "color: #2274A5;">**Trapsite**</span>, factor 

* <span style = "color: #2274A5;">**X**</span>, numeric variable referring to the latitudinal (N) coordinates of the camera   

* <span style = "color: #2274A5;">**Y**</span>, numeric variable referring to the longitudinal (E) coordinates of the camera   

* <span style = "color: #2274A5;">**Z**</span>, numeric variable referring to the elevation at the camera site  

* <span style = "color: #2274A5;">**StartDate**</span>, date identifying the start of the camera deployment 

* <span style = "color: #2274A5;">**StartDate**</span>, date identifying the end of the camera deployment 

* <span style = "color: #2274A5;">**TrapCode**</span>, factor referring to the unique identified for the camera site  

* <span style = "color: #2274A5;">**Camera**</span>, factor referring to the brand of camera deployed at the camera site  

* <span style = "color: #2274A5;">**Type**</span>, factor referring to whether animal was observed in a picture (P) or video (V)  
* <span style = "color: #2274A5;">**Date**</span>, date identifying the date the picture or video was taken 

* <span style = "color: #2274A5;">**RDAte**</span>, a duplicate of the date column but formatted so R would recognize it automatically as a date (not necessary with new versions of R and updated code) 

* <span style = "color: #2274A5;">**Time**</span>, time (24 hr format) identifying the when the picture or video was taken 

* <span style = "color: #2274A5;">**Occasion**</span>, factor referring to the unique 14-day period that each picture or video occurred (only applicable to sessions 2 & 3)  

* <span style = "color: #2274A5;">**RawName**</span>, character describing the raw image file name  

* <span style = "color: #2274A5;">**Species**</span>, factor referring to the common name for the animal in the image 

* <span style = "color: #2274A5;">**NoAnimals**</span>, integer quantifying the number of animals in the image  

* <span style = "color: #2274A5;">**Sex**</span>, factor referring to the sex of the animal in the image (u = unknown, m = male, f = female)   

* <span style = "color: #2274A5;">**Image quality**</span>, character with qualitative description of image quality 

* <span style = "color: #2274A5;">**Problem**</span>, character with qualitative description of image quality issue/s 

* <span style = "color: #2274A5;">**Sequence**</span>, integer quantifying the number of images in the sequence with the animal 

* <span style = "color: #2274A5;">**Comments**</span>, character description of comments from the image tagger (FCC staff/volunteers)  



### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">cams_data_autumn.csv</span>]

* **Number of variables/columns:** 27
* **Number of observations/rows:** 76

**Variable List:**

* <span style = "color: #2274A5;">**Session**</span>, factor referring to which monitoring session the data belong to (1 = pilot session, 2 = winter session, 3 = autumn session)  

* <span style = "color: #2274A5;">**TrapCode**</span>, factor referring to the unique identified for the camera site  

* <span style = "color: #2274A5;">**X**</span>, numeric variable referring to the latitudinal (N) coordinates of the camera   

* <span style = "color: #2274A5;">**Y**</span>, numeric variable referring to the longitudinal (E) coordinates of the camera   

* <span style = "color: #2274A5;">**Z**</span>, numeric variable referring to the elevation at the camera site 

* <span style = "color: #2274A5;">**Impact**</span>, character describing any anthropogenic impact observed at the camera site, determined by the camera deployment team  

* <span style = "color: #2274A5;">**distnatlro**</span>, numeric variable quantifying the distance to the nearest national road measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**distsettle**</span>, numeric variable quantifying the distance to the nearest human settlement measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**diststream**</span>, numeric variable quantifying the distance to the nearest stream measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**denslocalr**</span>, numeric variable quantifying the density of local roads  at the camera site measured as a proportion and extracted in GIS 

* <span style = "color: #2274A5;">**distlocalr**</span>, numeric variable quantifying the distance to the nearest local road measured in meters and extracted in GIS  


* <span style = "color: #2274A5;">**TRI5**</span>,  numeric variable quantifying the terrain ruggedness index (as defined in [Riley et a. 1999](https://download.osgeo.org/qgis/doc/reference-docs/Terrain_Ruggedness_Index.pdf)) 

* <span style = "color: #2274A5;">**CLC2018**</span>, factor describing the Corine Land Cover classification (CLC) code from the 2018 CLC data [available here](https://land.copernicus.eu/en/products/corine-land-cover?tab=documentation)   

* <span style = "color: #2274A5;">**CLC112**</span>, numeric variable defining the proportion of CLC - discontinuous urban fabric in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC221**</span>, numeric variable defining the proportion of CLC - vineyards in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC222**</span>, numeric variable defining the proportion of CLC - fruit trees and berry plantations in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  


* <span style = "color: #2274A5;">**CLC231**</span>, numeric variable defining the proportion of CLC - pastures in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC242**</span>, numeric variable defining the proportion of CLC - complex cultivation patters in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC311**</span>, numeric variable defining the proportion of CLC - broad-leaved forest in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*) 

* <span style = "color: #2274A5;">**CLC312**</span>, numeric variable defining the proportion of CLC - coniferous forest in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC313**</span>, numeric variable defining the proportion of CLC - mixed forest in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC321**</span>, numeric variable defining the proportion of CLC - natural grasslands in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC322**</span>, numeric variable defining the proportion of CLC - moors and heathland in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC324**</span>, numeric variable defining the proportion of CLC - transitional woodland-shrub in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC332**</span>, numeric variable defining the proportion of CLC - bare rocks in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*) 

* <span style = "color: #2274A5;">**CLC512**</span>, numeric variable defining the proportion of CLC - water bodies in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  



### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">cams_data_winter.csv</span>]

* **Number of variables/columns:** 27
* **Number of observations/rows:** 64

**Variable List:**

*Note: variable list is the same as cams_data_autumn.csv (above)*

* <span style = "color: #2274A5;">**Session**</span>, factor referring to which monitoring session the data belong to (1 = pilot session, 2 = winter session, 3 = autumn session)  

* <span style = "color: #2274A5;">**TrapCode**</span>, factor referring to the unique identified for the camera site  

* <span style = "color: #2274A5;">**X**</span>, numeric variable referring to the latitudinal (N) coordinates of the camera   

* <span style = "color: #2274A5;">**Y**</span>, numeric variable referring to the longitudinal (E) coordinates of the camera   

* <span style = "color: #2274A5;">**Z**</span>, numeric variable referring to the elevation at the camera site 

* <span style = "color: #2274A5;">**Impact**</span>, character describing any anthropogenic impact observed at the camera site, determined by the camera deployment team  

* <span style = "color: #2274A5;">**distnatlro**</span>, numeric variable quantifying the distance to the nearest national road measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**distsettle**</span>, numeric variable quantifying the distance to the nearest human settlement measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**diststream**</span>, numeric variable quantifying the distance to the nearest stream measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**denslocalr**</span>, numeric variable quantifying the density of local roads  at the camera site measured as a proportion and extracted in GIS 

* <span style = "color: #2274A5;">**distlocalr**</span>, numeric variable quantifying the distance to the nearest local road measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**TRI5**</span>,  numeric variable quantifying the terrain ruggedness index (as defined in [Riley et a. 1999](https://download.osgeo.org/qgis/doc/reference-docs/Terrain_Ruggedness_Index.pdf)) 

* <span style = "color: #2274A5;">**CLC2018**</span>, factor describing the Corine Land Cover classification (CLC) code from the 2018 CLC data [available here](https://land.copernicus.eu/en/products/corine-land-cover?tab=documentation)   

* <span style = "color: #2274A5;">**CLC112**</span>, numeric variable defining the proportion of CLC - discontinuous urban fabric in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC221**</span>, numeric variable defining the proportion of CLC - vineyards in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC222**</span>, numeric variable defining the proportion of CLC - fruit trees and berry plantations in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  


* <span style = "color: #2274A5;">**CLC231**</span>, numeric variable defining the proportion of CLC - pastures in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC242**</span>, numeric variable defining the proportion of CLC - complex cultivation patters in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC311**</span>, numeric variable defining the proportion of CLC - broad-leaved forest in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*) 

* <span style = "color: #2274A5;">**CLC312**</span>, numeric variable defining the proportion of CLC - coniferous forest in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC313**</span>, numeric variable defining the proportion of CLC - mixed forest in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC321**</span>, numeric variable defining the proportion of CLC - natural grasslands in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC322**</span>, numeric variable defining the proportion of CLC - moors and heathland in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC324**</span>, numeric variable defining the proportion of CLC - transitional woodland-shrub in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*)  

* <span style = "color: #2274A5;">**CLC332**</span>, numeric variable defining the proportion of CLC - bare rocks in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*) 

* <span style = "color: #2274A5;">**CLC512**</span>, numeric variable defining the proportion of CLC - water bodies in the camera cell (*see link for CLC2018 or Land_cover_codes.pdf doc in the relevant literature folder for more information on CLC nomenclature and methodologies*) 



### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">Trap_Effort_S2</span>]

Data for cameras in session 2 (Winter)

* **Number of variables/columns:** 9
* **Number of observations/rows:** 64

**Variable List:**

* <span style = "color: #2274A5;">**TrapCode**</span>, factor referring to the unique identified for the camera site  

* <span style = "color: #2274A5;">**Occasion_X**</span>, *for occasions 1 - 8* - numeric integer indicating the number of days in each two-week occasion that at least one camera at each site was functional


### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">Trap_Effort_S3</span>]

Data for cameras in session 3 (Autumn)

* **Number of variables/columns:** 8
* **Number of observations/rows:** 76

**Variable List:**

* <span style = "color: #2274A5;">**TrapCode**</span>, factor referring to the unique identified for the camera site  

* <span style = "color: #2274A5;">**Occasion_X**</span>, *for occasions 1 - 7* - numeric integer indicating the number of days in each two-week occasion that at least one camera at each site was functional


## Processed Data


### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">ro_sem_dat_2018-2019.csv</span>]  


* **Number of variables/columns:** 30
* **Number of observations/rows:** 138

**Variable List:**

* <span style = "color: #2274A5;">**session**</span>, factor referring to which monitoring session the data belong to (1 = pilot session, 2 = winter session, 3 = autumn session)  

* <span style = "color: #2274A5;">**trapcode**</span>, factor referring to the unique identified for the camera site  

* <span style = "color: #2274A5;">**trapeffort**</span>, numeric integer indicating to the total number of days at least 1 camera was working at each site for each session (winter & autumn)  

* <span style = "color: #2274A5;">**hare:other**</span>, numeric integer for each species indicating the total number of independent detections (images taken at least XXmin apart)  

* <span style = "color: #2274A5;">**z**</span>, numeric variable referring to the elevation at the camera site 

* <span style = "color: #2274A5;">**denslocalr**</span>, numeric variable quantifying the density of local roads  at the camera site measured as a proportion and extracted in GIS 

* <span style = "color: #2274A5;">**tri5**</span>,  numeric variable quantifying the terrain ruggedness index (as defined in [Riley et a. 1999](https://download.osgeo.org/qgis/doc/reference-docs/Terrain_Ruggedness_Index.pdf)) 

* <span style = "color: #2274A5;">**clc_forest**</span>,  numeric variable quantifying the proportion of forest at the camera site, determined by summing the proportion of broadleaf forest, coniferous forest, and mixed forest from the raw data 

* <span style = "color: #2274A5;">**distnatlro**</span>, numeric variable quantifying the distance to the nearest national road measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**distsettle**</span>, numeric variable quantifying the distance to the nearest human settlement measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**diststream**</span>, numeric variable quantifying the distance to the nearest stream measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**distlocalr**</span>, numeric variable quantifying the distance to the nearest local road measured in meters and extracted in GIS  

