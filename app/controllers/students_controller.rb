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
		id= params[:id]
		@student =Student.find(id)
		erb :show
	end

# Recibimos la peticion  get del servidoor que nos redirige al edit.html.erb
	get '/:id/edit' do
    id = params[:id]
    @student =Student.find(id)
    erb :edit
  end


# método que llama los datos del formulario
	post'/' do
		#llamamos al método create
		Student.create(student_params)
		redirect '/students'
	end

	delete '/:id' do
		Student.destroy(params[:id])
		redirect'/students'
	end


	put '/:id' do
		Student.edit(params[:id], studentEditParams)
		redirect 'students'
	end

# retorna los parametros que vienen desde new.html.erb
	def student_params
		params[:student]
	end

	def studentEditParams
		params[:studentEdit]
	end







end
