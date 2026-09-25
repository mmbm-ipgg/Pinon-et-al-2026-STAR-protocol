# Pinon-et-al-2026-STAR-protocol

------ ImageJ Macro ------
-- Pre-requisites --
Save .tiff files in a folder per condition (Drug, #tumor)
Create a second folder to save results
-- Run --
Open the ImageJ Macro named "Counting_cells_LD"
Complete the experimental conditions
Click on Run
Choose the folder containing the images
Choose the folder to save the results in .txt

------ R Code ------
-- Pre-requisites --
Merge the .txt file to gather Live and Dead cell counts for one tumor and one drug (several concentrations)
Copy/paste the R code in the same folder where is located the .txt file
-- Run --
Open the R Code. The path of the R Code should be the same path of the .txt file
Comment the statistical analysis if # of biological replicates < 3. If # of biological replicates > 3, uncomment it.
Change the title of the graphes
Select the whole code and run it.
