#!/usr/bin/perl

#validación de parámetros
if (@ARGV < 4)
{
  die "ERROR: Debe ingresar mínimo cuatro parámetros";
}
else
{
  $ubicacionArticulo = $ARGV[0];
  $ubicacionCantidad = $ARGV[1];
  $inputFile = $ARGV[2];
  $outputFile = $ARGV[3];
}

my %acumulador = ();

#validación de arvhivo de entrada
if(-e $inputFile)
{
  open(INPUT,"<$inputFile");
  if($ubicacionArticulo != $ubicacionCantidad)
  {
    while($linea = <INPUT>)
    {
      @campos = split(/;/,$linea);
      if($ubicacionArticulo > @campos or $ubicacionArticulo < 1)
      {
        die "ERROR: Ubicación del artículo inválida\n";
      }
      else
      {
        if($ubicacionCantidad > @campos or $ubicacionCantidad < 1)
        {
          die "ERROR: Ubicación de la cantidad inválida\n";
        }
        else
        {
          $clave = $campos[$ubicacionArticulo - 1];
          $acumulador->{$clave} = $acumulador->{$clave} + $campos[$ubicacionCantidad - 1];
        }
      }
    }
  }
  else
  {
    die "ERROR: Las ubicaciones de los campos de artículo y cantidad deben ser distintas\n";
  }
  close(INPUT);
  open(OUTPUT, ">>$outputFile");
  while (($clave,$valor) = each $acumulador) {
    print OUTPUT "$clave,$valor\n";
  }

  close(OUTPUT);

}
else
{
  die "ERROR: El arvhivo de entrada suministrado no existe\n";
}
