class TeachersController < ApplicationController
	# Con esta linea  podemos trabajar con archivos  con formato html.erb > esto es código ruby embebido  en html
	Tilt.register Tilt::ERBTemplate, "html.erb"

	#contruimos la rtuta por la cual se cargaran las vistas
	set :views, File.join( APP_ROOT, 'app', 'views', 'teachers')

	#peticion get /usuarios al servidor mediante el protocolo http
	get "/" do
		@teachers = Teacher.all  #llamamos al método .all de la clase 'Teacher'
		erb :index
	end

	#Peticion get /usuarios al servidor mediante el protocolo http

	get "/:id" do
		id= params[:id].to_i
		@teacher =Teacher.all[id]
		erb :show
	end
end
