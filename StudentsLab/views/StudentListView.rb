require 'fox16'
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
include Fox

require 'fox16'

include Fox

class StudentListView < FXMainWindow
  def initialize(app)
    super(app, "Student Information Table", width: 800, height: 400)
    setup_layuot()
    setup_filter_frame()
    setup_table_frame()
    setup_crud_frame()
  end

  def setup_layuot()
    main_frame = FXVerticalFrame.new(self, opts: LAYOUT_FILL)
    # Контейнер для размещения фреймов горизонтально
    top_frame = FXHorizontalFrame.new(main_frame, opts: LAYOUT_FILL)
    
    # Левый фрейм (контейнер для дополнительных элементов, занимает 20% ширины)
    @frame_left = FXVerticalFrame.new(top_frame, opts: LAYOUT_SIDE_LEFT)
    
    # Правый фрейм (занимает оставшиеся 80% ширины)
    @frame_right = FXVerticalFrame.new(top_frame, opts: LAYOUT_FILL | LAYOUT_SIDE_RIGHT)

    @buttom_frame = FXHorizontalFrame.new(@frame_right, opts: LAYOUT_SIDE_BOTTOM)
  end

  def setup_filter_frame()
    FXLabel.new(@frame_left, "Фильтрация")

    # Добавление метки
    FXLabel.new(@frame_left, "Введите Фамилию и ИО:")
  
    # Поле для ввода текста
    text_field = FXTextField.new(@frame_left, 20)

    FXLabel.new(@frame_left, "Наличие гита:")

    # Создание ComboBox с тремя элементами
    combo_box_git = FXComboBox.new(@frame_left, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN | FRAME_THICK)
    combo_box_git.numVisible = 3  # Количество видимых элементов в раскрытом списке

    # Добавление вариантов в ComboBox
    combo_box_git.appendItem("не важно")
    combo_box_git.appendItem("нет")
    combo_box_git.appendItem("есть")

    combo_box_git.currentItem = 0

    git_field = FXTextField.new(@frame_left, 20)
    git_field.text = "Поиск по гиту"

    git_field.enabled = false
    
    combo_box_git.connect(SEL_COMMAND) do
      case combo_box_git.currentItem
      when 0
        git_field.enabled = false 
      when 1
        git_field.enabled = false        # Поле полностью отключено
      when 2
        git_field.enabled = true         # Поле доступно для ввода
        git_field.editable = true
      end
    end

    FXLabel.new(@frame_left, "Наличие почты:")
    combo_box_email = FXComboBox.new(@frame_left, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN | FRAME_THICK)
    combo_box_email.numVisible = 3  # Количество видимых элементов в раскрытом списке

    # Добавление вариантов в ComboBox
    combo_box_email.appendItem("не важно")
    combo_box_email.appendItem("нет")
    combo_box_email.appendItem("есть")

    combo_box_email.currentItem = 0

    email_field = FXTextField.new(@frame_left, 20)
    email_field.text = "Поиск по почте"

    email_field.enabled = false
    
    combo_box_email.connect(SEL_COMMAND) do
      case combo_box_email.currentItem
      when 0
        email_field.enabled = false 
      when 1
        email_field.enabled = false        # Поле полностью отключено
      when 2
        email_field.enabled = true         # Поле доступно для ввода
        email_field.editable = true
      end
    end

    FXLabel.new(@frame_left, "Наличие телефона:")
    combo_box_phone = FXComboBox.new(@frame_left, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN | FRAME_THICK)
    combo_box_phone.numVisible = 3  # Количество видимых элементов в раскрытом списке

    # Добавление вариантов в ComboBox
    combo_box_phone.appendItem("не важно")
    combo_box_phone.appendItem("нет")
    combo_box_phone.appendItem("есть")

    combo_box_phone.currentItem = 0

    phone_field = FXTextField.new(@frame_left, 20)
    phone_field.text = "Поиск по телефону"

    phone_field.enabled = false

    combo_box_phone.connect(SEL_COMMAND) do
      case combo_box_phone.currentItem
      when 0
        phone_field.enabled = false 
      when 1
        phone_field.enabled = false        # Поле полностью отключено
      when 2
        phone_field.enabled = true         # Поле доступно для ввода
        phone_field.editable = true
      end
    end


    # Telegram
    FXLabel.new(@frame_left, "Наличие Telegram:")
    combo_box_telegram = FXComboBox.new(@frame_left, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN | FRAME_THICK)
    combo_box_telegram.numVisible = 3

    combo_box_telegram.appendItem("не важно")
    combo_box_telegram.appendItem("нет")
    combo_box_telegram.appendItem("есть")

    combo_box_telegram.currentItem = 0

    telegram_field = FXTextField.new(@frame_left, 20)
    telegram_field.text = "Поиск по Telegram"

    telegram_field.enabled = false

    combo_box_telegram.connect(SEL_COMMAND) do
      case combo_box_telegram.currentItem
      when 0, 1
        telegram_field.enabled = false
      when 2
        telegram_field.enabled = true
        telegram_field.editable = true
      end
    end
  end

  def setup_table_frame()
    table = FXTable.new(@frame_right, opts: LAYOUT_FILL)
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

  def setup_crud_frame()
    button_add = FXButton.new(@buttom_frame, "Добавить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
    button_update = FXButton.new(@buttom_frame, "Обновить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
    button_change = FXButton.new(@buttom_frame, "Изменить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
    button_delete = FXButton.new(@buttom_frame, "Удалить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
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