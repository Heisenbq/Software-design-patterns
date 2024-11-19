class DataList
  def initialize(data)
    @data = data
  end

  def select(number)
    element = @data[number]
    if element && !@selected.include?(element.id)
      @selected << element.id
    end
  end

  def get_selected
    @selected
  end

  protected
  def get_names
    raise NotImplementedError, "Not implemented"
  end

  def get_data
    raise NotImplementedError, "Not implemented"
  end

  private
  attr_accessor :data, :selected

end