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


from datetime import datetime

#------------------------------------------------------------------------

# Escribir el contenido del mail para extraer la orden a realizar

#-------- Archivo donde se guardan las ordenes -----------------

s = open('/DATA/a_modulo-3/orden.txt')
dato = s.read()

#-------- Archivo donde se guardan las ordenes SEGURAS -----------------

t = open('/DATA/a_modulo-3/orden-seguro.txt')
datos = t.read()


match = re.findall("##alta", dato)
if match: subprocess.call(['/DATA/a_modulo-5/alta'])

match = re.findall("##r#", dato)
if match: subprocess.call(['/DATA/a_modulo-5/query'])

match = re.findall("##a#", dato)
if match: subprocess.call(['/DATA/a_modulo-5/query-a'])

match = re.findall("##q#", dato)
if match: subprocess.call(['/DATA/a_modulo-5/query-consulta'])

match = re.findall("##s#", dato)
if match: subprocess.call(['/DATA/a_modulo-5/conexion-segura'])

#----------------- SEGURO ---------------------------------------

match = re.findall("##rs#", datos)
if match: subprocess.call(['/DATA/a_modulo-5/s-query'])

match = re.findall("##as#", datos)
if match: subprocess.call(['/DATA/a_modulo-5/s-query-a'])
