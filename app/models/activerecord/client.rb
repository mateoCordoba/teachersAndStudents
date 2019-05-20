require 'pg'
module ActiveRecord
  class Client
    #Metodo que define la propia conexion con la bd con usuarios contraseña, y nombre de la Db
    def connection
      @connection ||=PG.connect(
        dbname:'semillero',
        user:"mateo",
        password:'Boundman'
      )
    end

    #Metodo que ejecuta un query de sql con postgres sea un update,insert, select
    def executeQuery(query)
      connection.exec(query).values
      connection.exec(query)
    end

  end


end
