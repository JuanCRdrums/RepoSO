re=".*;"$1";.*;.*"
idUsuario=$(grep $re Usuarios.dat | sed 's/\(.*\)\(;.*\)\(;.*;\)\(.*\)/\1/')
re=".*;"$idUsuario";.*;.*"
grep $re EmpresasPorUsuario.dat | sed 's/\(.*\)\(;.*;\)\(0;\)\(.*\)/\1;Inactivo;\4/g' | sed 's/\(.*\)\(;.*;\)\(1;\)\(.*\)/\1;Activo;\4/g'
