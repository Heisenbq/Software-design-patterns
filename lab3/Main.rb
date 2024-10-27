require './Menu.rb'
require './ArrayHandler'
# D:\3 курс\ruby projects\lab3\array.txt путь к файлу

# Menu.get_menu
arr = ArrayHandler.new([1,15,21])
s = arr.inject() {|acc,el| acc * el}
puts s

ar = Array.new ([1,15,21])

ar.cycle(2) {|el| el+=1}
puts ar