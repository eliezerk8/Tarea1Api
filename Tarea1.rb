
	require 'httparty'
	require 'openssl'

	URL = 'https://sepa.utem.cl/rest/api/v1'
	AUTH = {username: '2E5Vw7WUCm', password: '0754e0cbf6df85c40be0715e643c9f1c'}


	def anio
  docente = '/academia/docentes'
  respuesta = HTTParty.get(URL.encode+docente, basic_auth: AUTH)

  lista = []
  lista2 = []
  respuesta.each do |data|
    lista2 = data['fechaNacimiento']
    if lista2 < '1980'
    lista << data['nombres']
      lista << data['fechaNacimiento']
    end
    File.open('peraltarojas',"w") do |f|
      f.puts lista
    end
  end

  puts lista

end

def asignaturas1
  asignatura = '/docencia/asignaturas'
  respuesta = HTTParty.get(URL.encode+asignatura, basic_auth: AUTH)
  lista = []
  lista2 = []
  respuesta.each do |data|
    lista2 = data['codigo']
    if lista2.include? "INF"
      lista << data['nombre']
      lista << data['codigo']
    end
    File.open('peraltarojas',"w") do |f|
      f.puts lista
    end
  end
  puts lista
end

	def punto_tres
	    docentes= "/academia/docentes"
	    respuesta = HTTParty.get(URI.encode(URL+docentes), basic_auth: AUTH)
	    anio = []
	    respuesta.each do |docentes|
	    	anio << f['anio']
	    	if f['anio']<=1980 
	    		promedio_uno = promedio_uno + f['nota'].to_f
	    		ct_uno = ct_uno + 1
	    	end
	    end
	    filtro = anio.uniq 
	    

	end

	def menu
		puts "Ingrese seleccion : "
		puts " 1. Mostrar todas las asignaturas con codigo INF"
		puts " 2. Mostrar el total de las asignaturas con codigo INF impartidas el 2015"
		puts " 3. Crear nómina de todos los docentes nacidos antes del 1980. "
		print "Seleccion: "
		seleccion = gets.chomp.to_i
		 case seleccion
			when 1 then punto_uno
			when 2 then punto_dos
			when 3 then punto_tres
			when 4 then punto_cuatro
			else 	
		end
	end

menu
