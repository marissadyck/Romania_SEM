---
output:
  html_document: default
  pdf_document: default
---
# OSM_2022-2023
This repository contains data, R scripts, and other materials for a structural equation modeling analysis of camera trap images in Romania associated with Dyck et al., 2025 - Bottoms up! Structural equation modeling reveals landscape characteristics shape an intact Carpathian mammal assemblage 


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

The scripts and several other files in this repository are .rmd or .md files which are written in RStudio using R programming language. If you are not familiar with R or want to see an overview of any of the files you can view either the .html (open in a web browser) or .pdf files instead of the R files (this will still show you the code that was run as well as the outputs but will not require you to use R). 


*Files in data folder*

*/processed*  
This folder includes data that has been cleaned and reformatted using scripts within this repository. 

* <span style = "color: #7B0F17;">**ro_sem_dat_2018-2019.csv**</span>;  contains detection data for animals seen on the camera traps and landscape covariates used in the analysis, formatted for the [piecewiseSEM package](https://cran.r-project.org/web/packages/piecewiseSEM/index.html) 



*/raw*  
This folder includes raw detection and covariate data.   

* <span style = "color: #7B0F17;">**animals_on_cameras_2018-2019.csv**</span>; contains raw detection data for the animals seen on the cameras  

* <span style = "color: #7B0F17;">**cams_data_autumn_2018-2019.csv**</span>; contains raw landscape covariates for each camera site deployed in the autumn monitoring season 

* <span style = "color: #7B0F17;">**cams_data_winter_2018-2019.csv**</span>; contains raw landscape covariates for each camera site deployed in the winter monitoring season 



*Files in figures folder*   

This folder contains various plots generated in the scripts of this repository for the purposes of data visualization.  


*Files in relevant literature folder* 

This folder contains files that may be relevant for understanding the analysis. 

* <span style = "color: #7B0F17;">**piecewiseSEM.pdf**</span>; Overview of the piecewiseSEM package (R package used for this analysis) 


*Files in scripts folder* 

This file contains the various scripts needed for data formatting, visualization, and analysis.   

* <span style = "color: #7B0F17;">**1_RO_SEM_data_formatting**</span>; .rmd file and knitted .html/.pdf files for data cleaning and formatting     

* <span style = "color: #7B0F17;">**2_RO_SEM_analysis**</span>; .rmd file and knitted .html/.pdf files for conducting piecewise structural equation models (SEM) analysis 


## RAW DATA   

### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;"> animals_on_cameras_2018-2019.csv</span>]  

* **Number of variables/columns:** 24
* **Number of observations/rows:** 6,621

**Variable List:**

* <span style = "color: #2274A5;">**Sort**</span>, integer used to order/sort the data for internal purposes    

* <span style = "color: #2274A5;">**Session**</span>, factor referring to which monitoring session the data belong to (1 = pilot session, 2 = winter session, 3 = autumn session)  

* <span style = "color: #2274A5;">**X**</span>, numeric variable referring to the latitudinal (N) coordinates of the camera   

* <span style = "color: #2274A5;">**Y**</span>, numeric variable referring to the longitudinal (E) coordinates of the camera   

* <span style = "color: #2274A5;">**Z**</span>, numeric variable referring to the elevation at the camera site  

* <span style = "color: #2274A5;">**Impact**</span>, character describing any anthropogenic impact observed at the camera site, determined by the camera deployment team  

* <span style = "color: #2274A5;">**distnatlro**</span>, numeric variable quantifying the distance to the nearest national road measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**distsettle**</span>, numeric variable quantifying the distance to the nearest human settlement measured in meters and extracted in GIS  

* <span style = "color: #2274A5;">**diststream**</span>, numeric variable quantifying the distance to the nearest stream measured in meters and extracted in GIS  

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



### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">.csv</span>]

* **Number of variables/columns:** 
* **Number of observations/rows:** 

**Variable List:**



### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">.csv</span>]

* **Number of variables/columns:** 
* **Number of observations/rows:** 

**Variable List:**



## Processed Data


### DATA-SPECIFIC INFORMATION FOR: [<span style = "color: #7B0F17;">ro_sem_dat_2018-2019.csv</span>]  


* **Number of variables/columns:** 
* **Number of observations/rows:** 

**Variable List:**
