i=1
codigosProveedor=$(ls input | cut -f1 -d '.')
cantidadCodigos=$(ls input | cut -f1 -d '.' | wc -w)
listaInput=$(ls input)
while [ $i -le $cantidadCodigos ]
do
  codProveedor=$(echo $codigosProveedor | cut -f$i -d ' ')
  validaProv=0
  validaDefinitivo=0
  while read -r linea
  do
    codLeido=$(echo $linea | cut -f1 -d ',')
    if [ "$codLeido" = "$codProveedor" ]
    then
      validaProv=1
    fi
  done < tablas/provema.txt
  if [ $validaProv -eq 1 ]
  then
    archivo=$(echo $listaInput | cut -f$i -d ' ')


    while read -r linea1
    do
      validaDefinitivo=0
      codProductoInput=$(echo $linea1 | cut -f2 -d ',')
      while read -r linea2
      do
        codProductoTxt=$(echo $linea2 | cut -f1 -d ',')
        if [ "$codProductoTxt" = "$codProductoInput" ]
        then
          tipoProductoTxt=$(echo $linea2 | cut -f2 -d ',')
          while read -r linea3
          do
            tipoProductoProv=$(echo $linea3 | cut -f2 -d ',')
            if [ "$tipoProductoTxt" = "$tipoProductoProv" ]
            then
              codProveedorProv=$(echo $linea3 | cut -f1 -d ',')
              if [ "$codProveedor" = "$codProveedorProv" ]
              then
                #aquí se cumplen todas las validaciones
                validaDefinitivo=1
              fi
            fi
          done < tablas/provema.txt
        fi
      done < tablas/productos.txt

      if [[ $validaDefinitivo -eq 1 ]]; then
        aaaamm=$(echo $archivo | cut -f2 -d '.' | cut -c1-6)
        salida="ok/FACTURAS."$aaaamm".txt"
      else
        salida="error/facturas.error."$aaaamm".err"
      fi
      echo $linea1 >> $salida
    done < input/$archivo
  fi
  i=$(($i+1))
done
