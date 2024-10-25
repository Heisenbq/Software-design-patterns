require './Menu.rb'
require './ArrayHandler'
# D:\3 курс\ruby projects\lab3\array.txt путь к файлу

# Menu.get_menu
arr = ArrayHandler.new([1,15,21])
arr.cycle(2) do |element| 
  puts element
end
