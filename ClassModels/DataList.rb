class DataList
  def initialize(data)
    @data = data
  end

  def select(number)
    raise IndexError, "Index out of bounds" if element && !@selected.include?(element.id)
    element = @data[number-1]
    @selected << element.id
    @data[number-1]
  end

  def get_selected
    @selected
  end

  def get_names
    raise NotImplementedError, 'Not implemented'
  end

  def get_data
    raise NotImplementedError, 'Not implemented'
  end

  private

  attr_accessor :data, :selected
end
