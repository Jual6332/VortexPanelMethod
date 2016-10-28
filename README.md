# VortexPanelMethod
A computational lab for ASEN 3111 that uses the Vortex Panel Method to compute the lifting flow over several different NACA airfoils. 

## Running the Code:
* Download all Matlab Files
* Open in Matlab software (2014b or newer)
* Run the "runThis.m" file
* All calculations will be run

## Changing the Code for Other Resolutions
* Go to line 11 on "runThis.m" and change N to your desired number (Note: That N=5000 panels is the nominal case)

## Change the Code for Other Airfoil Shapes or Freestream Conditions
* Go to line 12 to change freestream Velocity
* Go to line 13 to change angle of attack
* Go to lines 17, 18, 19 to change airfoil geometry



## Journal of Updates
#### This serves as a listing of software updates during the software development process
#### Updates are listed reverse chronologically

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
