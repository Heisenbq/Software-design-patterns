require 'fox16'
include Fox
class ObserverView < FXMainWindow
  def initialize(app, name)
    super(app, name, width: 800, height: 400)
  end
  def set_table_params(column_names,entities_count)
    raise NotImplementedError, "Метод не реализован!"
  end

  def set_table_data(data_table)
    raise NotImplementedError, "Метод не реализован!"
  end
end