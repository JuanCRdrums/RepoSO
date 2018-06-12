#!/bin/perl
open(ENTRADA,'<datos/categorias.txt') || die "ERROR: No se puede abrir el archivo de categorías";
my %servicios = ();
if (!(-e "datos/categorias.txt"))
{
  die "Archivo de categorías inexistente";
}

while($linea = <ENTRADA>)
{
  @valores = split(/;/,$linea);
  chomp($valores[1]);
  $servicios{$valores[1]} = $valores[0];
}

opendir(DIR,'datos');
@dir = readdir(DIR);
foreach $f (@dir)
{
  
}
