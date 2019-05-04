module Storage
	class Base


		# Nombre: "mateo"
		def initialize(params = {})
			params.each do |key, value|
				instance_variable_set("@#{key}", value)

				self.class.send(:define_method, key) do
					instance_variable_get("@#{key}")
				end

			end # End params.each
		end

		def save
			headers = self.class.file_headers
			collection = self.class.all

			collection << self

			CSV.open(self.class.file_path, 'w') do |csv|
				csv << headers
				collection.each do |record|
					values = headers.map do |header|
						record.send(header)
					end
					csv << values
				end
			end
		end #SAVE

		def self.file_headers
			CSV.open(file_path, &:readline)
		end

		# Método .all que tre 5 instancias de Student, este métodolo llamaremos en el model
	  def self.all
	    CSV.foreach(file_path, headers: true).map{ |item| new(item) }
	  end

	  # Método con el cual obtenemos la ruta del fichero
	  def self.file_path
	    File.join(APP_ROOT, 'db', "#{table_name}.csv")
	  end

	  def self.table_name
	  	raise("NotImplementedError")
	  end


	end # end class
end # module
