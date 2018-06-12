my %salida = ();

if(@ARGV != 1 or ($ARGV[0] ne "-s" and $ARGV[0] ne "-f"))
{
  die "ERROR: Debe ejecutar el programa con la opción -s o -f.";
}
else
{
  $execute = 1;
  while($execute == 1)
  {
    $ruta = $ENV{'PWD'};
    opendir(DIR,$ruta);
    @files = grep(/.*/,readdir(DIR));
    closedir(DIR);
    @toRead = grep(/.*\.dat/,@files);
    foreach $file (@toRead) {
      @name = split(/-/,$file);
      $codProvincia = $name[0];
      @aux = split(/\./,$name[1]);
      $codLocalidad = $aux[0];
      open(LOCALIDAD,"<Localidades.tab");
      $procesable = 0;
      while($linea = <LOCALIDAD>)
      {
        @localidades = split(/;/,$linea);
        chomp($localidades[1]);
        if($codProvincia eq $localidades[0] and $codLocalidad eq $localidades[1])
        {
          $procesable = 1;
        }
      }

      if($procesable == 0)
      {
        print "El archivo $file no es procesable\n";
        unlink($file);
      }
      else
      {
        open(ENTRADA,"<$file");
        while($linea2 = <ENTRADA>)
        {
          @registro = split(/;/,$linea2);
          $salida->{"poblacion"} = $salida->{"población"} + $registro[1] + $registro[3];
          $salida->{"fecha"} = $registro[0];
          $salida->{"provincia"} = $codProvincia;
        }
        close(ENTRADA);
        open(SALIDA,">>salida.txt");
        print SALIDA "$salida->{fecha};$salida->{provincia};$salida->{poblacion}\n";
      }

      if ($ARGV[0] eq "-s") {
        sleep(30*60);
      }
      else
      {
        $execute = 0;
      }

    }
  }
}
