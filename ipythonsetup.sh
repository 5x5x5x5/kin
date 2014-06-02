#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# with Ipython 2.x notebook server on python 3.x using miniconda.

 # I like htop
 sudo apt-get install htop

# Install Python 3.4 and Scipy stack with Anaconda2.0
wget http://repo.continuum.io/anaconda3/Anaconda3-2.0.0-Linux-x86_64.sh
bash Anaconda3-2.0.0-Linux-x86_64.sh

# Next steps now unnccessary after Anaconda 2 release
#Install miniconda3
# wget http://repo.continuum.io/miniconda/Miniconda3-3.3.0-Linux-x86_64.sh
# bash Miniconda3-3.3.0-Linux-x86_64.sh #must agree to license and such

#Need to login and out - look for flags to fix this
# conda install anaconda # need to click yes - look for flags to skip this

## Default install does not include IPython 2 yet, so...
# conda update ipython

## Install sklearn-pandas
pip install sklearn-pandas

# installxlrd library to enable pandas import of Excel files
pip install xlrd

# neat display of version info for all important libraries
# run this in IPython
#%install_ext http://raw.github.com/jrjohansson/version_information/master/version_information.py

# Call this:
#%load_ext version_information
#%version_information numpy, scipy, matplotlib, sympy

##Additional package for cheminformatics - turns out to need python 2.7
#sudo apt-get install python-rdkit librdkit1 rdkit-data

# Remove installation files
rm -f Anaconda3-2.0.0-Linux-x86_64.sh
