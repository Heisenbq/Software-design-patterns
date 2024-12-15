# require File.expand_path('D:/3курс/RubyProjects/StudentsLab/views/StudentListView.rb')
class DataList
  attr_accessor :data
  def initialize(data)
    raise ArgumentError, "Required instance of other class" unless check_object_type(data)
    @data = data
    @selected = []
    @observers = []
  end

  def notify
    @observers.each do |observer|
      observer.set_table_params(self.get_names,self.get_data.count_of_rows)
      observer.set_table_data(self.get_data)
    end
  end

  def add_observer(observer)
    @observers << observer
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

  def data=(data)
    raise ArgumentError, "Required instance of other class" unless check_object_type(data)
    @selected = []
    @data = data
  end

  def get_names
    raise NotImplementedError, 'Not implemented'
  end

  def get_data(index = 0)
    data = []
    selected = self.get_selected
    @data.each do |obj|
      index+=1
      row = get_row_of_values_of_object(obj)
      row.unshift(index)
      data.append(row)
    end

    # selected.each do |index|
    #   obj = @data[index]
    #   row = get_row_of_values_of_object(obj)
    #   row.unshift(index)
    #   data.append(row)
    # end
    DataTable.new(data)
  end

  private

  def get_row_of_values_of_object(obj)
    raise NotImplementedError, 'Not implemented'
  end

  def check_object_type(obj)
    raise NotImplementedError, 'Not implemented'
  end
end
