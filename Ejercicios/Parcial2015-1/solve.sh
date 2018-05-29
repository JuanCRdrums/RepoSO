clear
month=$(date +%m)
year=$(date +%Y)
cd $1
numFiles=$(ls AP_[0-9][0-9][0-9][0-9][0-9][0-9]\.log | wc -w)
i=1
lista=$(ls AP_[0-9][0-9][0-9][0-9][0-9][0-9]\.log)

while [[ $i -le $numFiles ]]; do
  File=$(echo $lista | cut -f$i -d ' ')
  monthValidar=$(echo $File | cut -c8-9)

  if [[ $monthValidar -le $month ]]; then #el nombre es válido
    while read -r linea
    do
      tipoError=$(echo $linea | cut -f2 -d ';')
      if [[ "$tipoError" == "ERROR" ]]; then
        codAp=$(echo $linea | cut -f3 -d ";")
        master="../mae/aplic.dat"
        while read -r linea1
        do
          codApMaster=$(echo $linea1 | cut -f1 -d ',')
          if [[ "$codApMaster" == "$codAp" ]]; then
            estado=$(echo $linea1 | cut -f3 -d ',')
            if [[ "$estado" == "activo" ]]; then #el campo es válido. Se debe listar
              echo $linea
            fi
          fi
        done < $master
      fi
    done < $File
  fi

  i=$(($i+1))
done

cd ..
