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

		def self.all

		end

	  def self.table_name
	  	raise("NotImplementedError")
	  end


	end # end class
end # module
