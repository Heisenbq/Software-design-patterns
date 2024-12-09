require 'fox16'
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
include Fox

require 'fox16'

include Fox

class StudentListView < FXMainWindow
  def initialize(app)
    super(app, "Student Information Table", width: 800, height: 400)
  
    main_frame = FXVerticalFrame.new(self, opts: LAYOUT_FILL)
    # Контейнер для размещения фреймов горизонтально
    top_frame = FXHorizontalFrame.new(main_frame, opts: LAYOUT_FILL)
    
    # Левый фрейм (контейнер для дополнительных элементов, занимает 20% ширины)
    frame_left = FXVerticalFrame.new(top_frame, opts: LAYOUT_SIDE_LEFT)
    label_left = FXLabel.new(frame_left, "Left Frame", opts: LAYOUT_FILL)
    
    # Правый фрейм (занимает оставшиеся 80% ширины)
    frame_right = FXVerticalFrame.new(top_frame, opts: LAYOUT_FILL | LAYOUT_SIDE_RIGHT)

    buttom_frame = FXHorizontalFrame.new(main_frame, opts: LAYOUT_SIDE_BOTTOM)
    label_buttom = FXLabel.new(buttom_frame, "Buttom Frame", opts: LAYOUT_FILL)
  
    # Создаем таблицу
    table = FXTable.new(frame_right, opts: LAYOUT_FILL)
  
    # Устанавливаем количество строк и столбцов
    table.setTableSize(5, 9)  # 5 строк, 9 столбцов (по количеству полей)
  
    # Устанавливаем заголовки для столбцов
    table.setColumnText(0, "Surname")
    table.setColumnText(1, "First Name")
    table.setColumnText(2, "Last Name")
    table.setColumnText(3, "Email")
    table.setColumnText(4, "Phone")
    table.setColumnText(5, "ID")
    table.setColumnText(6, "Telegram")
    table.setColumnText(7, "GitHub")
    table.setColumnText(8, "DOB")
  
    # Пример данных студентов
    students = [
      ["Smith", "John", "A.", "john.smith@example.com", "123-456-7890", "S12345", "@john_smith", "github.com/john_smith", "01/01/2000"],
      ["Doe", "Jane", "B.", "jane.doe@example.com", "987-654-3210", "S67890", "@jane_doe", "github.com/jane_doe", "02/02/1999"],
      ["Taylor", "Alex", "C.", "alex.taylor@example.com", "555-123-4567", "S11223", "@alex_taylor", "github.com/alex_taylor", "03/03/1998"]
      # Добавьте больше студентов по аналогии
    ]
  
    # Заполнение таблицы данными студентов
    students.each_with_index do |student, row|
      student.each_with_index do |value, col|
        table.setItemText(row, col, value)
      end
    end
  end
end



# Создание и запуск приложения
app = FXApp.new
window = StudentListView.new(app)

x_position = 400
y_position = 400
window.move(x_position, y_position)

app.create
window.show
app.run