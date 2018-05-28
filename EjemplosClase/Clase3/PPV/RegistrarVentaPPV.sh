echo "Señal PPV: "
er="s-\(.*;.*;\)\(.*\);$2;.*-\2-g"
re='.*;.*;.*;'$2';.*'
grep "$re" SignalsAndChanels.dat > temporal.dat
sed $er temporal.dat
c=$(wc -l temporal.dat)
echo $c
if [[ '$c' == '1' ]];
then
  echo "PPV registrado con éxito"
else
  echo "ERROR: Canal no disponible"
fi
rm temporal.dat
