dia=$(date | cut -f 3 -d ' ')
mes=$(date | cut -f 2 -d ' ')
hora=$(date | cut -f 4 -d ' ')
year=$(date | cut -f 6 -d ' ')
echo "Son las "$hora" del día "$dia" del mes "$mes" del año "$year
