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

# Busquedad en el log de todos los valores ##
subprocess.call(['/DATA/a_modulo-2/a_step-2'])
# Limpieza de los datos recolectados en el script anterior buscando usuario y los valores de ##r ##a etc
subprocess.call(['/DATA/a_modulo-3/a_step-3'])
# Ejecucion de los scripts de acuerdo a las ordenes obtenidas
subprocess.call(['/DATA/a_modulo-4/a_step-4'])
# Modulo que busca en la carpeta SHARED archivos con notificaciones a usuarios 
subprocess.call(['/DATA/a_modulo-6/a_step-6'])
# Modulo que genera la sesiones toma los valores de screen y conecta las unidades compartidas
subprocess.call(['/DATA/a_modulo-8/a_step-8'])
# Modulo de log guarda la infornacion en bruto en el archivo screen-history
subprocess.call(['/DATA/a_modulo-9/a_step-9'])


# Limpieza del log
os.remove("/tmp/screenlog-telegram")

