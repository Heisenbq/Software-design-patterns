class DataTable
  def initialize(data)
    unless data.is_a?(Array) && data.all? {|e| e.is_a?(Array)}
      raise ArgumentError, "Data is not an 2d Array"
    end
    @data = data
  end

  private
  attr_reader :data
end
