puts "Введите команду языка руби: "
ruby_command = gets.chomp
#Выполнение команды руби
eval(ruby_command)

puts "\nВведите команду операционной системы:"
software_command = gets.chomp
#Выполнение команды ОС
system(software_command)