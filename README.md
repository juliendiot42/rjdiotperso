[![pipeline status](https://gitlab.com/juliendiot42/rjdiotperso/badges/master/pipeline.svg)](https://gitlab.com/juliendiot42/rjdiotperso/commits/master)
[![codecov](https://codecov.io/gh/juliendiot42/rjdiotperso/branch/master/graph/badge.svg)](https://codecov.io/gh/juliendiot42/rjdiotperso)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Package "rjdiotperso"
=====================

This directory contains the "rjdiotperso" package for the R programming language.
This package contains Julien Diot's personal R code which can nevertheless be useful to others.

The code is available under the GNU Public License (version 3 and later).
See the LICENSE.md file for usage permissions.

The content of this directory is versioned using git, the central repository being hosted on [GitHub](https://github.com/juliendiot42/rjdiotperso).
You can report issues on GitHub directly ([rjdiotperso/issues](https://github.com/juliendiot42/rjdiotperso/issues)).

## Citation
Please cite this package when using it for data analysis:
```
R> citation("rjdiotperso")
```
See also citation() for citing R itself.

## Installation
To install this package, the easiest is to directly install the package from GitHub:
```
R> install.packages("devtools")
R> devtools::install_github("juliendiot42/rjdiotperso")
```

Once the package is installed, start using it:
```
R> library(rjdiotperso)
R> help(package=rjdiotperso)
```

## Contribution
**For developpers**, when editing the content of this repo, increment the version of the package in DESCRIPTION and execute the following commands:
```
R> devtools::document()
R> devtools::check()
```
