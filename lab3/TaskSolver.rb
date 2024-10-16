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
end