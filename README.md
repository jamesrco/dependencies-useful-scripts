# dependencies-useful-scripts
This repo contains dependencies for code in other repos, and some generally useful scripts.
<h2>"General-use" scripts</h2>
Several MATLAB scripts borrowed, either with modifications (as noted) or in unmodified form, from Dave Glover, Scott Doney, and Bill Jenkins, the instructors of the Modeling, Data Analysis and Numerical Techniques for Geochemistry course (12.747) at MIT. Original versions of scripts are available at http://www.whoi.edu/12.747/mfiles.html (link valid as of 9/9/15).

These include several scripts for linear and non-linear regression:

1. [linfit.m](https://github.com/jamesrco/dependencies-useful-scripts/blob/master/linfit.m): Run a standard Type 1 linear regression on data of two variables.
2. [lsqfitma.m](https://github.com/jamesrco/dependencies-useful-scripts/blob/master/lsqfitma.m): Run major axis linear regression.
3. [lsqcubic.m](https://github.com/jamesrco/dependencies-useful-scripts/blob/master/lsqcubic.m): Run two-way least-squares linear regression with weighted data (i.e., data containing uncertainities in both x and y variables).
4. [nlleasqr.m](https://github.com/jamesrco/dependencies-useful-scripts/blob/master/nlleasqr.m): Run non-linear least squares regression of (nearly) any function specified by the user.
5. [dfdp.m](https://github.com/jamesrco/dependencies-useful-scripts/blob/master/dfdp.m): Calculate numerical partial derivatives (Jacobian) for use with nlleasqr.m

<h2>Scripts for geosciences data I/O</h2>
Several scripts for data input/output and various rudimentary follow-on analyses. Most for stuff in oceanography and the earth sciences (since I'm an oceanographer). These have been moved to https://github.com/jamesrco/GeoSciData_IO/
