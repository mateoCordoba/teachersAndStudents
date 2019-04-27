module Storage
	class Base
		# Método .all que tre 5 instancias de Student, este métodolo llamaremos en el model
	  def self.all    
	    file.map { |item| new(*item) }     
	  end  
	  # Método con el cual abrimos el fichero y  nos retorna cada linea en el fichero como un arreglo  
	  def self.file    
	    File.open(file_path).map{ |line| line.split(',')}   
	  end

	  # Método con el cual obtenemos la ruta del fichero
	  def self.file_path
	    File.join(APP_ROOT, 'db', "#{table_name}.txt")
	  end

	  def self.table_name
	  	raise("NotImplementedError")
	  end


	end # end class
end # module