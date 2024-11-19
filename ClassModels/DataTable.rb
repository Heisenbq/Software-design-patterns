class DataTable
  def initialize(data)
    unless data.is_a?(Array) && data.all? {|e| e.is_a?(Array)}
      raise ArgumentError, "Data is not an 2d Array"
    end
    @data = data
  end

  def get_element(num_of_row,num_of_column)
    @data[num_of_row][num_of_column]
  end
  def count_of_rows
    @data.count
  end
  def count_of_columns
    @data[0].count
  end
  private
  attr_reader :data
end

table = DataTable.new([[1,2,3,4],
                      [4,5,6,4],
                      [7,8,9,4]])

puts table.get_element(0,1)