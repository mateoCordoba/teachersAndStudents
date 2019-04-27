class Teacher < Storage::Base

	attr_accessor :nombre, :correo, :materia

	# constructor para incializ8ar ñlas variables

	def initialize(nombre, correo, materia)
		self.nombre = nombre
		self.correo = correo
		self.materia = materia

	end

	def self.table_name
		'teachers'
	end

	
end

















