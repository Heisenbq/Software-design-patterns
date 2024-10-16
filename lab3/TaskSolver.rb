class TaskSolver

  #1.17
  def self.replace_max_min(array)
    max_index = array.find_index(array.max)
    min_index = array.find_index(array.min)
    tmp = array.max
    array[max_index] = array.min
    array[min_index] = tmp
    result = array
    yield (result) if block_given?
  end

  #1.29
  def self.max_el_in_range?(array)
    puts "Выберите интервал: \n a = "
    a = gets.chomp.to_i
    puts "b = "
    b = gets.chomp.to_i
    max_el = array.max
    result = array[a..b].include?(array.max)
    yield (result) if block_given?
  end

  #1.41
  def self.average_of_modules(array)
    sum = array.sum { |el| el.abs }
    result = sum / array.size.to_f
    yield (result) if block_given?
  end

  #1.53
  def self.build_new_list(list)
    sum = list.sum { |el| el.abs }
    average = (sum / list.size).floor
    max = list.max
    new_list = Array((average+1)..(max-1))
    yield (new_list) if block_given?
  end

end