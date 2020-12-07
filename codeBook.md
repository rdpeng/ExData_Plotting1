---
title: "ExData Plotting codebook"
author: Joaquín Soliño
date: 07/12/2020
output: html_notebook
---

This document includes the general description of functions and aids to execute the scripts of this project.

The project includes 4 scripts: `plot1.R`, `plot2.R`, `plot3.R`, `plot4.R`. Each one produces the plot: `plot1.png`, `plot2.png`, `plot3.png`, `plot4.png`. 

All the Scripts have the same structure. The common part has two functions:

* A function named `download_unzip_data`: this functions has no params. It downloads and unzip the source file from UCI repository to a local folder "data". The zip file is finnally removed. Returns two messages indicating that the zip file is downlowded and the uncompressed file is storaged.

* A function named `load_prepare_data`: this functions has no params. It reads data from the source "data/household_power_consumption.txt", then transforms date and time to proper types and subsets the data for the specific days: 2007/02/01 and 2007/02/02. Returns this data frame, that'll be used for the `create_plot` function, depending on the script file.

Finally, there is an specific fuction in any script: 

* Function `create_plot1(date)`: this function has only one parameter (`date` - data frame) and produces an histogram from Global Active Power variable and stores it in the file `plot1.png` with 480x480 pixel.

* Function `create_plot2(date)`: this function has only one parameter (`date` - data frame) and produces line plot from Global Active Power variable and stores it in the file `plot2.png` with 480x480 pixel.

* Function `create_plot3(date)`: this function has only one parameter (`date` - data frame) and produces Sub_metering lines plot and stores it in the file `plot3.png` with 480x480 pixel.

* Function `create_plot4(date)`: function takes only one parameter (`data` - data frame) and creates a multiple plot (2 rows, 2 colums) with the proper specification of the project, named as `plot4.png` with 480x480 pixel. 

