class DataTable
  def initialize(data)
    unless data.is_a?(Array) && data.all? {|e| e.is_a?(Array)}
      raise ArgumentError, "Data is not an Array"
    end
    @data = data
  end

end

table = DataTable.new([
                        [1,2,3],
                        [4,5,6],
                        [7,8,9],
                      ])
puts table.to_s