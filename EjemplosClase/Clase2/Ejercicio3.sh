i=1
chmod +x "$1"
while read -r linea
do
  echo $i: $linea
  i=$(($i+1))
done <"$1"
