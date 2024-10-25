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
end