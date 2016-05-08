#CODEBOOK

This code book gives a brief overview of how the data was processed to give the required plots.

## Reading in of data
The data was read in with the read.csv function and the number of rows that was skipped is 64800 and the number of rows read in was 5000. 

This was done to allow a buffer of more than 2 days for data for processing. 

## Processing of data.

The dplyr library was used to de-select the data and time columns. They were convert to PoSITx format with strptime function and later joined back again.

## Plotting of data

Data was plotted with the basic built in plot function of the R system. The plots were exported as PNG files with dimensions of 480 px by 480 px.
