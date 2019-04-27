class Student < Storage::Base

  attr_accessor :nombre, :correo, :fecha, :programa

  # Constructor para inicializar las variables
  def initialize(nombre, correo, fecha, programa)
    self.nombre = nombre
    self.correo = correo
    self.fecha = fecha
    self.programa = programa 
  end

  def self.table_name
    'students'
  end
  

end # END CLASS

