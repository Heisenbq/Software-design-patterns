require './Menu.rb'
require './ArrayHandler'
# D:\3 курс\ruby projects\lab3\array.txt путь к файлу

# Menu.get_menu
# arr = ArrayHandler.new(['123', '22', '1234', '1', 'asd'])
# puts arr.max_by(2) {|num| num.size}


arr = ArrayHandler.new(['123', '22', '1234', '1', 'asd'])
arr.each_slice(2) {|ar| puts ar.inspect}


# ar = Array.new ([1,15,21])

# ar.cycle(2) {|el| el+=1}
# puts ar