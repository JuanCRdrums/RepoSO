clear
re='^'$1',.*,.*,.*,.*'
ocurrencia=$(grep $re FacturasElectronicas.dat)
urlFactura=$(echo $ocurrencia | sed 's/\(.*,.*,.*,\)\(.*\),.*/\2/' )
codBoleto=$(echo $ocurrencia | sed 's/\(.*,\)\(.*\)\(,.*\),.*/\2/')
re='^'$codBoleto',.*,.*,.*,.*'
urlBoletos=$(grep $re BoletosBancarios.dat | sed 's/\(.*\)\(,.*,\)\(.*,\)\(.*,\)\(.*\)/\5/g')
numCobro=$(grep $re BoletosBancarios.dat | sed 's/\(.*,\)\(.*\)\(,.*\)\(,.*,\)\(.*\)/\2/g')
echo $urlFactura";"$urlBoletos";"$numCobro
