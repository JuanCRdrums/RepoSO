clear
chmod +x RegistrarVentaPPV.sh
echo "REGISTRAR VENTA PPV"
echo "Número telefónico: "
read tel
echo "Código del cliente: "
read codCliente
echo "Canal: "
read canal
./RegistrarVentaPPV.sh $codCliente $canal
