#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# with Ipython 2.x notebook server on python 3.x using miniconda.

 # I like htop
 sudo apt-get install htop

#Install miniconda3
wget http://repo.continuum.io/miniconda/Miniconda3-3.3.0-Linux-x86_64.sh
bash Miniconda3-3.3.0-Linux-x86_64.sh #must agree to license and such

#Need to login and out - look for flags to fix this
conda install anaconda # need to click yes - look for flags to skip this

## Default install does not include IPython 2 yet, so...
conda update ipython

## Install sklearn-pandas
pip install sklearn-pandas

##Additional package for cheminformatics - turns out to need python 2.7
#sudo apt-get install python-rdkit librdkit1 rdkit-data

## Create nbserver profile
ipython profile create nbserver
ipython

#In ipython execute the following
#> from IPython.lib import passwd
#> passwd()
##copy the sha:....
#> !mkdir certificates
#> cd certificates/
#> !openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
##some crazy questions
#> cd ..
#> cd .ipython/profile_nbserver
##exit ipython

emacs ipython_notebook_config.py
#####Paste this part in the header - shift insert works for emacs
c = get_config()

# Kernel config
c.IPKernelApp.pylab = 'inline'  # if you want plotting support always

# Notebook config
c.NotebookApp.certfile = u'/home/ubuntu/certificates/mycert.pem'
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'sha1:bcd259ccf...[your hashed password here]'
# It is a good idea to put it on a known, fixed port
c.NotebookApp.port = 8888
#####C-x C-s and C-x C-z as a reminder

cd $HOME
ipython notebook --profile=nbserver

## open up port 8888 of instance
## https://ec2-gobbledgook-amazonaws.com:8888 will take you there
