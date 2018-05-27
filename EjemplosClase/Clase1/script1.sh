#Prueba de diferencia entre Variable y Ambiente
export VARIABLE="UNO" #Exporta la variable al ambiente de los hijos que tenga el proceso y a los procesos que están al mismo nival
echo "VARIABLE:$VARIABLE" #Internamente, $VARIABLE no está inicializada. Solo mostrará un valor si se inicializa desde el ambiente (por fuera del Sript)
