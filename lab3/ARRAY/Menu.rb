require './TaskSolver.rb'
class Menu

  def self.get_menu
    array = choose_read_type
    perform_task(array)
  end


  private 
  def self.from_terminal
    puts "Введите массив (через пробел): "
    array = gets.chomp.split(' ').map(&:to_i)
  end

  def self.from_file
    puts "Введите путь к файлу: "
    path = gets.chomp

    begin
      File.open(path,'r') do |file|
        array = file.read.split(' ').map(&:to_i)
      end
    rescue
      print "failed to open #{filename}\n"
      exit
    end
  end
  
  def self.choose_read_type
    puts "Выберите способ считывания данных: \n"
    puts "1 - C терминала"
    puts "2 - с файла"

    choice = gets.chomp

    case choice
    when '1'
      array = from_terminal
    when '2'
      array = from_file
    else
      puts "Некорректный способ считывания" 
    end
  end

  def self.perform_task(array)
    puts "Выберите какую задачу решить: "
    puts "1 - Дан целочисленный массив. Необходимо поменять местами минимальный и максимальный элементы массива."
    puts "2 - Дан целочисленный массив и интервал a..b. Необходимо проверить наличие максимального элемента массива в этом интервале."
    puts "3 - Дан целочисленный массив. Найти среднее арифметическое модулей его элементов."
    puts "4 - Для введенного списка построить новый с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение."
    puts "5 - Дан целочисленный массив и натуральный индекс (число, меньшее размера массива). Необходимо определить является ли элемент по указанному индексу глобальным минимумом."
    choice = gets.chomp
    case choice
    when '1'
      TaskSolver.replace_max_min(array) {|result| puts "Результат: #{result}"}
    when '2'
      TaskSolver.max_el_in_range?(array) {|result| puts "Результат: #{result}"}
    when '3'
      TaskSolver.average_of_modules(array) {|result| puts "Результат: #{result}"}
    when '4'
      TaskSolver.build_new_list(array) {|result| puts "Результат: #{result}"}
    when '5'
      TaskSolver.is_min(array) {|result| puts "Результат: #{result}"}
    else 
      "Задачи под таким номером не существует"
    end

  end

end