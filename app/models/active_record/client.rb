module ActiveRecord

  class Client
    def connection
      @connection ||= PG.connect(
        dbname:'semillero'
      )
    end
    def executeQuery(query)
      connection.exec(query).values
    end

  end


end
