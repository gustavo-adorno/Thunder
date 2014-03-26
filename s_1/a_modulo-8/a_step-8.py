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

# Obtengo el hostname
hostname = socket.gethostname()

# Escribir el contenido del tmp para extraer la orden a realizar
s = open('/tmp/screenlog-telegram')
dato = s.read()

match = re.findall(hostname, dato)
if match: subprocess.call(['/DATA/s_1/a_modulo-8/up-telegram'])

match = re.findall("x86_64-linux-gnu", dato)
if match: subprocess.call(['/DATA/s_1/a_modulo-8/up-telegram'])

match = re.findall("lib/x86", dato)
if match: subprocess.call(['/DATA/s_1/a_modulo-8/up-telegram'])

match = re.findall("zero", dato)
if match: subprocess.call(['/DATA/s_1/a_modulo-8/error-telegram'])



