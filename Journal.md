
## Journal of Updates
#### This serves as a listing of software updates during the software development process
#### Updates are listed reverse chronologically



### Update 3:
Current progress: 
* Code changes
  * Nominal number of panels dropped to 250 from 2500
  * This amount error is allowable, with less than 1% error
* New functions
  * problem3.m
  * plotCLvsAlpha.m
* Report changes
  * Only missing Cp vs alpha graph and conclusion paragraph


### Update 2:
Current progress: 
* Report progress is coming along nicely
  * Error section finished
  * 3/4 pages filled
  * Results for Cl at alpha = 0deg displayed for different resolutions
* NACA_Airfoil.m is still working fine, no changes in a week
* Vortex_Panel.m function is working now, cl is not dependent on Vinf and c is function of Xb not local x
* Finished Error Analysis
  * Nominal number of panels of 1500, based on different resolutions
  * Determine a degree of error that is allowable
* Current item: Plotting cl vs alpha (continuous) for all airfoils
  * Issue: Code runs slow, thinking of decreasing number of panels


### Update 1:
Files initially commited to git

Current progress: 
* NACA_Airfoil.m is working perfectly, verified geometric depictions with corresponding actual airfoils.
* Vortex_Panel.m function is working perfectly, verified results with sample reults from "VortexPanelFromKuetheAndChow" Fortran results.
* Current item: Error Analysis
  * Find a nominal number of panels based on different resolutions
  * Determine a degree of error that is allowable (how close can I get to the solution while not being computationally expensive?)
  * Display results for Cl at alpha = 0deg for different resolutions
