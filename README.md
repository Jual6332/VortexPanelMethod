# VortexPanelMethod
A computational lab for ASEN 3111 that uses the Vortex Panel Method to compute the lifting flow over several different NACA airfoils. 

## Update Journal
### This serves as a listing of software updates during the software development process
### Updates are listed reverse chronologically

### Update 1:
Files initially commited to git
Current progress: 
* NACA_Airfoil.m is working perfectly, verified geometric depictions with corresponding actual airfoils.
* Vortex_Panel.m function is working perfectly, verified results with sample reults from "VortexPanelFromKuetheAndChow" Fortran results.
* Current item: Error Analysis
** Find a nominal number of panels based on different resolutions
** Determine a degree of error that is allowable (how close can I get to the solution while not being computationally expensive?)
** Display results for Cl at alpha = 0deg for different resolutions
