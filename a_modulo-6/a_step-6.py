#!/usr/bin/python

import os, sys
import glob, os
import shutil
import fnmatch
import re
import subprocess
import shutil
import time

# Modulo de APROBACIONES


# Open a file
path = "/DATA/SHARED/aprobaciones"
open("/DATA/a_modulo-6/path.txt","w").close()
f = open("/DATA/a_modulo-6/path.txt","a")
dirs = os.listdir( path )

# Imprimo todo el contenido de la carpeta new en el archivo spool1.txt
for file in dirs:
   print >>f,file
f.close()


subprocess.call(['/DATA/a_modulo-6/a_step2-6'])




