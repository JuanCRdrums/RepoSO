if(@ARGV < 2)
{
  die "ERROR: Debe haber como mínimo 2 parámetros\n";
}
else
{
  $zona = $ARGV[0];
  $plan = $ARGV[1];

  open(PLAN,"<plan.tab");
  $existe = 0;
  while($linea = <PLAN>)
  {
    @registro = split(/,/,$linea);
    if($plan eq $registro[0])
    {
      $existe = 1;
    }
  }

  close(PLAN);

  if($existe == 0)
  {
    die "ERROR: El plan ingresado no existe";
  }


  my %acumulado = ();
  $dir = $ENV{'PWD'};
  opendir(DIR,$dir);
  @files = grep(/benef.*/,readdir(DIR));
  closedir(DIR);
  foreach $file (@files) {
    open(ENTRADA,"<$file");
    while($linea = <ENTRADA>)
    {
      @registro = split(/,/,$linea);
      $oficina = $registro[0];
      if($zona eq $registro[1] and $plan eq $registro[2])
      {
        $acumulado->{$oficina} = $acumulado->{$oficina} + $registro[5];
      }
    }
  }

  print "Ingrese el nombre de un archivo para grabar la salida: ";
  $output = <STDIN>;
  chomp($output);

  if(-e $output)
  {
    print "El archivo $output ya existe, ¿desea sobreescribirlo? [Y/N]";
    $option = <STDIN>;
    chomp($option);
    if($option eq "N")
    {
      die;
    }
  }

  open(SALIDA,">>$output");

  while (($oficina,$monto) = each $acumulado)
  {
    print SALIDA "$oficina,$monto\n";
    if($monto <= 1000)
    {
      open(PLAN,"<plan.tab");
      while($linea = <PLAN>)
      {
        @registro = split(/,/,$linea);
        $descripcion = $registro[1];
        chomp($descripcion);
        if($plan eq $registro[0])
        {
          print "Para el plan $descripcion en la zona $zona, la oficina $oficina no superó los \$1000.\n";
        }
      }
    }
  }


}
