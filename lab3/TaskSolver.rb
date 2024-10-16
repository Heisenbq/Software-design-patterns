class TaskSolver

  #1.17
  def self.replace_max_min(array)
    max_index = array.find_index(array.max)
    min_index = array.find_index(array.min)
    tmp = array.max
    array[max_index] = array.min
    array[min_index] = tmp
    yield (array) if block_given?
  end
end