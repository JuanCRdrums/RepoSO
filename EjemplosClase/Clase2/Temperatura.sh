echo "---------------------------CONVERSOR DE TEMPERATURAS------------------------"
if [[ "$1" == "-c" ]];
then
  echo "Ingrese la cantidad de grados Celsius que desea convertir a Fahrenheit"
  read c
  f=$((9*$c/5+32))
  echo "Temperatura en grados Fahrenheit: "
  echo $f
elif [[ "$1" == "-f" ]];
then
  echo "Ingrese la cantidad de grados Fahrenheit que desea convertir a Celsius"
  read f
  c=$((5*($f-32)/9))
  echo "Temperatura en grados Celsius: "
  echo $c
fi
