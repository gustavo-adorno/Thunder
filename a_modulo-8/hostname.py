#!/usr/bin/python

import os, sys
import glob, os
import shutil
import fnmatch
import re
import subprocess
import shutil
import time
import shutil
import socket

from datetime import datetime

#------------------------------------------------------------------------

# Escribir el contenido del mail para extraer la orden a realizar

#f = open('/DATA/a_modulo-8/hostname.txt')
#name = f.readline()


name = socket.gethostname()
print name


#s = open('/DATA/a_modulo-8/test.txt')
#dato = s.read()

#match = re.findall(name, dato)
#if match: print "te econtre"



