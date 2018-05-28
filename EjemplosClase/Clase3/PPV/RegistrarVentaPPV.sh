echo "Señal PPV: "
er="s-\(.*;.*;\)\(.*\);$2;.*-\2-g"
re='/.*;.*;.*;'$2';.*/'
sed 
sed $re$er SignalsAndChanels.dat
