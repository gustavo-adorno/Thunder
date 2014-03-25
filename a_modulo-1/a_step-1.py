#!/usr/bin/python

import os, sys
import glob, os
import shutil
import fnmatch
import re
import subprocess
import shutil
import time

# Limpieza de los caracteres [ del archivo 

fin = open("/tmp/screenlog-telegram") 
fout = open("/tmp/screenlog-telegram-limpio", "wt") 
for line in fin:
    fout.write( line.replace('[', '') )
fin.close()
fout.close()

# Llamada a los scripts 

subprocess.call(['/DATA/a_modulo-2/a_step-2'])
subprocess.call(['/DATA/a_modulo-3/a_step-3'])
subprocess.call(['/DATA/a_modulo-4/a_step-4'])
subprocess.call(['/DATA/a_modulo-6/a_step-6'])
subprocess.call(['/DATA/a_modulo-8/a_step-8'])
subprocess.call(['/DATA/a_modulo-9/a_step-9'])


# Limpieza del log
os.remove("/tmp/screenlog-telegram")

