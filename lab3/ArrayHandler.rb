class ArrayHandler
  attr_accessor :array

  def initialize(array)
    self.array = array
  end


  def cycle(n)
    n.times do
      self.array.each do |el|
        yield(el) if block_given?
      end
    end
  end

  def inject(initial_value = nil)
    acc = initial_value ? initial_value : self.array[0]
    start = initial_value ? 0 : 1
    self.array[start..-1].each do |el|
      acc = yield(acc,el)
    end
    acc
  end

  def reject
    arr = Array.new
    self.array.each do |el|
      unless yield(el)
        arr.append(el)
      end
    end
    arr
  end

  def sort_by
    pairs = self.array.map {|element| [yield(element),element]}
    sorted_pairs = pairs.sort {|a,b| a[0] <=> b[0]}
    sorted_pairs.map {|element| element[1]}
  end
  
end