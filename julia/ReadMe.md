# ReadMe file for "yaksha/julia" - Automates the Julia Package installation from METADATA.jl


The Julia way is to use the REPL to install packages, so each time I wanted to install a registered package, I fired up the REPL and typed `Pkg.add("PackageName")` which would fetch the package from METADATA and install it on my machine. But manually typing this command (or giving it as a list) was a very cumbersome way to install packages for a new Julia installation.

In the older versions I used to add them to the REQUIRE file but touching this system file isnt optimal and I have broken the Julia installation quite often, especially in certain situations - read, tired and/or sleep-deprived while working late at night experimenting with a new package.  

Automating this process seemed more stable as "Julia-0.7+" has a brand new package manager called `Pkg3` (that will be renamed as 'Pkg' from ver-1.0), so I wrote my own demons for these repetitive and boring system tasks. Please note that this does not replace the Julia Pkg tasks, rather, it only acts as a wrapper around it. There are other stand-alone scripts for updating Julia, installing binaries, etc..


### binary64bit.sh
As the name suggests this will get the Julia 64-bit binaries.


### gitDEV.sh
This shell script will update your basic Julia installation with the latest (unstable) version of Julia from github master and build it.


### Pkg.sh
This small shell script will run some simple julia commands via the shell instead of the REPL mode. I use it to update my Julia system before firing up the REPL or to update packages when I am running a Jupyter notebook in parallel. When run, it will list all the julia packages that are not listed in your `REQUIRE` file or in `pkgMETADATA`, which means they are dependencies for other packages.


### PkgAdd.jl
This Julia program will install packages from a given text file (__pkgMetadata.txt__) for all listed packages in METADATA, whereas the other function using `git clone` is used to install non-registered packages with the URL. __NotaBene__: This does not superimpose on the package manager (Pkg) that tracks the Julia version requirements in a package file REQUIRE, nor does it have any local consequence on multiple versions of Julia installed - that is NA. If in doubt check the folder `.julia/vx.x` on your machine.


### PkgAdd.sh
This small shell script will automagically install packages without opening the REPL.


### pkgMETADATA.txt
The working list of packages that I need for my work.


### yaksha.jl
The module `yaksha`!
