#!/bin/sh
#!/bin/bash

# Armamdo del procesamiento paralelo leeo la segunda linea de cada archivo

FILE=/DATA/a_modulo-2/mensaje.txt
# Leer la primera linea del archivo
FILE2=$(head -2 $FILE | tail -1)

FILES=/DATA/a_modulo-2/mensaje-seguro.txt
# Leer la primera linea del archivo
FILES2=$(head -1 $FILES2 | tail -1)



F1=/DATA/s_1/a_modulo-3/f1.txt
F2=/DATA/s_1/a_modulo-3/f2.txt
F3=/DATA/s_1/a_modulo-3/f3.txt
F4=/DATA/s_1/a_modulo-3/f4.txt
F5=/DATA/s_1/a_modulo-3/f5.txt
F6=/DATA/s_1/a_modulo-3/f6.txt
F7=/DATA/s_1/a_modulo-3/f7.txt
F8=/DATA/s_1/a_modulo-3/f8.txt
F9=/DATA/s_1/a_modulo-3/f9.txt
F10=/DATA/s_1/a_modulo-3/f10.txt


S1=/DATA/s_1/a_modulo-3/s1.txt
S2=/DATA/s_1/a_modulo-3/s2.txt
S3=/DATA/s_1/a_modulo-3/s3.txt
S4=/DATA/s_1/a_modulo-3/s4.txt
S5=/DATA/s_1/a_modulo-3/s5.txt
S6=/DATA/s_1/a_modulo-3/s6.txt
S7=/DATA/s_1/a_modulo-3/s7.txt
S8=/DATA/s_1/a_modulo-3/s8.txt
S9=/DATA/s_1/a_modulo-3/s9.txt
S10=/DATA/s_1/a_modulo-3/s10.txt

F11=/DATA/s_1/a_modulo-3/usuario.txt
S11=/DATA/s_1/a_modulo-3/usuario-seguro.txt

F12=/DATA/s_1/a_modulo-3/orden.txt
S12=/DATA/s_1/a_modulo-3/orden-seguro.txt

F13=/DATA/reporte/tx.txt


# En este archivo almaceno la informacion que le sigue a ##r o ##a o ##q
F14=/DATA/s_1/a_modulo-3/cliente.txt
S14=/DATA/s_1/a_modulo-3/cliente-seguro.txt

F15=/DATA/s_1/a_modulo-3/formulario.txt
S15=/DATA/s_1/a_modulo-3/formulario-seguro.txt

F16=/DATA/s_1/a_modulo-3/numero.txt
S16=/DATA/s_1/a_modulo-3/numero-seguro.txt

F17=/DATA/s_1/a_modulo-3/accion.txt
S17=/DATA/s_1/a_modulo-3/accion-seguro.txt

# Generacion de usuario seguro
F18=/DATA/s_1/a_modulo-3/usuario-s.txt

# Leer la primera linea del archivo
head -1 $FILE2 | tail -1 >> $F1 

# Leer la primera linea del archivo SEGURO
head -1 $FILES2 | tail -1 >> $S1 



#-----Cliente que en realidad es la info que acompana a ##r# o ##a# o ##q# -----------

# Busqueda del campo con ## 
sed -n 's/^.*\(\s##[^ ]*\).*/\1/p' $F1 > $F4

# Busqueda del campo con ## en el archivo SEGURO 
sed -n 's/^.*\(\s##[^ ]*\).*/\1/p' $S1 > $S4


#-----------------------------------------------
# Elimino el ##r# para obtener el cliente
sed 's/##r#//' $F4 > $F6
sed 's/##a#//' $F6 > $F7
sed 's/##q#//' $F7 > $F10

# Elimino el primer caracter en blanco
sed 's/^ *//g' $F10 > $F14

#-----------------------------------------------
# Elimino el ##r# para obtener el cliente SEGURO
sed 's/##rs#//' $S4 > $S6
sed 's/##as#//' $S6 > $S10

# Elimino el primer caracter en blanco SEGURO
sed 's/^ *//g' $S10 > $S14


#-----------------------Orden ----------------------------------

# Leo el contenido del cliente para eliminarlo y obtener la orden
cliente=$(awk 'NR==1' $F14)

# Leo el contenido del cliente para eliminarlo y obtener la orden SEGURO
clientes=$(awk 'NR==1' $S14)

# Leo nuevamente la primer linea del archivo para obtener el cliente
sed -n 's/^.*\(\s##[^ ]*\).*/\1/p' $F1 > $F5

# Leo nuevamente la primer linea del archivo para obtener el cliente SEGURO
sed -n 's/^.*\(\s##[^ ]*\).*/\1/p' $S1 > $S5

# Obtengo la orden
sed 's/$cliente//' $F5 > $F12

# Obtengo la orden SEGURO
sed 's/$clientes//' $S5 > $S12

# ---------------------- Aprobaciones -----------------------

# Cortar los primeros dos caracteres
cut -c1-2 $F14 > $F15 

# Cortar los primeros dos caracteres SEGURO
cut -c1-2 $S14 > $S15 


# Elimina los primeros caracteres
sed 's/^...//' $F14 > $F8 

# Elimina los primeros caracteres SEGURO
sed 's/^...//' $S14 > $S8 


# Elinina los  ultimos tres caracteres
sed 's/.\{3\}$//' $F8 > $F16

# Elinina los  ultimos tres caracteres SEGURO
sed 's/.\{3\}$//' $S8 > $S16


# Obtengo el ok o el no
awk '{print substr($0, length($0)-1)}' $F14 > $F17

# Obtengo el ok o el no SEGURO
awk '{print substr($0, length($0)-1)}' $S14 > $S17


# ---------------------- Querys -----------------------




#--------------------- Usuario --------------------------------

# Obtengo el usuario eliminando campo que contiene ##
sed 's/##[^ ]*//g' $F1 > $F11

# Obtengo el usuario eliminando campo que contiene ## SEGURO
sed 's/##[^ ]*//g' $S1 > $S11

# Elimino los espacios blancos del final de cada linea
sed 's/ *$//' $F11 > $F2

# Elimino los espacios blancos del final de cada linea SEGURO
sed 's/ *$//' $S11 > $S2

# Elimino el primer caracter en blanco del archivo Usuario SEGURO
sed 's/^ *//g' $S2 > $S11

# Continuo con el analisis de las conexiones normales

# Agrego "_" a la lista de usuarios
sed "s/[ ][ ]*/_/g" $F2 > $F11

# Generacion de usuario seguro
sed 's/^/!_/' $F11 > $F18

# Eliminacion de la linea analizada
sed '1d' $FILE > $F3 

# Eliminacion de la linea analizada SEGURO
sed '1d' $FILES > $S3 

# Eliminacion de todas las lineas vacias
sed '/^$/d' $F3 > $FILE

# Eliminacion de todas las lineas vacias SEGURO
sed '/^$/d' $S3 > $FILES

# Limpiar archivo pasarela
cat /dev/null > $F1

# Limpiar archivo pasarela
cat /dev/null > $S1

usuario=$(awk 'NR==1' $F11)
orden=$(awk 'NR==1' $F12)


if [ -s "$F4" ]
then
        date +"%d-%m-%y %T" >> $F13
        echo "$usuario | $orden"  >> $F13
        echo "tx@" >> $F13
        echo "__________________________" >> $F13
else
        echo "Uhh"
fi

#--------------- LOG SEGURO -----------------------------

usuarios=$(awk 'NR==1' $S11)
ordens=$(awk 'NR==1' $S12)


if [ -s "$S4" ]
then
        date +"%d-%m-%y %T" >> $F13
        echo "$usuarios | $ordens"  >> $F13
        echo "tx@" >> $F13
        echo "__________________________" >> $F13
else
        echo "Uhh"
fi





