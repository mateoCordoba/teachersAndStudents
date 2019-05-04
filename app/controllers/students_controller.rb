class StudentsController < ApplicationController
	# Con esta linea  podemos trabajar con archivos  con formato html.erb > esto es código ruby embebido  en html
	Tilt.register Tilt::ERBTemplate, "html.erb"

	#contruimos la rtuta por la cual se cargaran las vistas
	set :views, File.join( APP_ROOT, 'app', 'views', 'students')

	#peticion get /usuarios al servidor mediante el protocolo http
	get "/" do
		@students =Student.all #Lamamos al metodo 'all de la clase Student'
		erb :index
	end

	# Método por el cual ingresaremos un unevo ususario
	get '/new' do
		erb :new
	end

	#Peticion get /usuarios al servidor mediante el protocolo http
	get "/:id" do
		id= params[:id].to_i
		@student =Student.all[id]
		erb :show
	end

# Método mediante el cual  creamos un nuevo estudiante, lo guardamos, y al redireccionamos al index
	post'/' do
		student= Student.new(student_params)
		student.save
		redirect '/students'
	end

	def student_params
		params[:student]
	end







end
