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
    get_names_of_attributes_of_object
  end

  def get_data
    index = 0
    data = []

    selected = self.get_selected
    selected.each do |index|
      obj = @data[index]
      row = get_row_of_values_of_object(index,obj)
      data.append(row)
    end
    DataTable.new(data)
  end

  private

  def get_row_of_values_of_object(index,obj)
    raise NotImplementedError, 'Not implemented'
  end

  def get_names_of_attributes_of_object
    raise NotImplementedError, 'Not implemented'
  end

  attr_accessor :data, :selected
end
