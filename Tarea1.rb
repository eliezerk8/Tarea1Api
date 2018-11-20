
	require 'httparty'
	require 'openssl'

	URL = 'https://sepa.utem.cl/rest/api/v1'
	AUTH = {username: '2E5Vw7WUCm', password: '0754e0cbf6df85c40be0715e643c9f1c'}


	def punto_uno
	    asignatura= "/docencia/asignaturas/{INF}/cursos"
	    respuesta = HTTParty.get(URI.encode(URL+asignatura), basic_auth: AUTH)
	    nombres = []
		respuesta.each do |asignatura|
			nombres << asignatura[nombre]
		end
		[
				{
						"nombre": "string",
						"codigo": "string",
						"departamento": {
								"facultad": {
										"sigla": "string",
										"nombre": "string"
								},
								"nombre": "string",
								"id": 0
						},
						"creditos": 0,
						"horasSemanales": 0,
						"fechaCreacion": "2018-11-20T03:51:35.153Z"
				}
		]
	    File.open("peraltarojas","w") do |f|
	    	f.write(aux)
	    end

	end

	def punto_dos
	    asignatura= "/docencia/asignaturas/{INF}/cursos"
	    respuesta = HTTParty.get(URI.encode(URL+asignatura), basic_auth: AUTH)
	    aux = []
	    ct = 0
	    respuesta.each do |asignatura|
	    	if f['curso']['anio']==2015	
	    		ct = ct + 1
	    		aux << "Las asignaturas de informatica el 2015 fueron #{ct}"
	   		end	
			end
			{
					"nombre": "string",
					"codigo": "string",
					"departamento": {
							"facultad": {
									"sigla": "string",
									"nombre": "string"
							},
							"nombre": "string",
							"id": 0
					},
					"creditos": 0,
					"horasSemanales": 0,
					"fechaCreacion": "2018-11-20T03:55:33.830Z"
			}
	    File.open("peraltarojas","w") do |f|
	    	f.write(aux)
	    end

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