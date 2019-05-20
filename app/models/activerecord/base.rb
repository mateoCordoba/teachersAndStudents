module ActiveRecord
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

		# Método para guardar ocntacto
		def save

		end

		def self.create(params)
			columns = params.keys.join(', ')
			values = params.values.map {|v| "'#{v}'"}.join(', ')
			query = "insert into #{table_name}(#{columns} values (#{values});"
			executeQuery(query)
		end

		#instaciamos la clase client que tiene la coneccion y el query
		# si la variable tiene un ||= si la variable esta vacia le asigna el valor si esta llena la deja tal cual
		def self.client

			$client ||= ActiveRecord::Client.new
		end

		def self.executeQuery(query='')
			client.executeQuery(query)
		end

		#método que retorna el registro si lo encuentra
		def self.find(id)
			results = executeQuery("select * from #{table_name} where id = #{id};")
			# Capturamos un error en caso de que el id no exista
			raise("RecordNotFound") if results.cmd_tuples.zero?
			# Generamos una instancia del primer registro
			new(results.each.first)
		end

		# Método que retorna todos los registros
		def self.all
			results = executeQuery("select * from #{table_name};")

		end

		def self.destroy(id)
			results = executeQuery("delete from #{table_name} where id = #{id};")
			raise("RecordNotFound") if results.cmd_tuples.zero?
			true			
		end

	  def self.table_name
	  	raise("NotImplementedError")
	  end


	end # end class
end # module
