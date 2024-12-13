require 'pg'

class PGClient
  private_class_method :new
  @@instance = nil

  private 

  def initialize(db_config)
    @connection = PG.connect(db_config)
  end

  public 

  def self.instance(db_config)
    unless @@instance
      @@instance = new(db_config)
    end
    @@instance  
  end

  def exec(query)
    @connection.exec(query)
  end
  def exec_params(query,params)
    @connection.exec_params(query, params)
  end
end