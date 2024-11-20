class DataList
  def initialize(data)
    @data = data
    @selected = []
  end

  def select(number)
    element = @data[number]
    unless element 
      raise IndexError, "Index out of bounds"
    end
    if !@selected.include?(number)
      @selected << number
    end
    @data[number]
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


  attr_accessor :data, :selected
end
