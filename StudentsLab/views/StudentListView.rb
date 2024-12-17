require 'fox16'
# Dir[File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/*.rb')].each { |file| require file }
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/controllers/StudentListController.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataTable.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/views/ObserverView.rb')
include Fox

require 'fox16'

include Fox

class StudentListView < ObserverView
  def initialize(app)
    super(app, "Student Information Table")
    setup_layuot()
    setup_filter_frame()
    setup_table_frame()
    setup_crud_frame()

    @controller = StudentListController.new(self)
    @current_page = 1
    @elems_on_page = 10
    @controller.refresh_data(@elems_on_page,@current_page)

    pagination_buttons()
  end

  def pagination_buttons
    paginator_frame = FXHorizontalFrame.new(@frame_right, opts: LAYOUT_FILL)
    buttonBack = FXButton.new(paginator_frame, "<<", nil, nil, 0, LAYOUT_CENTER_X)
    amount_of_pages = (@controller.get_student_count.to_f / @elems_on_page.to_f).ceil
    page_text = "#{@current_page}/#{amount_of_pages}"
    pages_label = FXLabel.new(paginator_frame, page_text)
    buttonForward = FXButton.new(paginator_frame, ">>", nil, nil, 0, LAYOUT_CENTER_X)
    buttonBack.connect(SEL_COMMAND) do 
      if (@current_page) == 1 
        next
      end
      @current_page -=1
      @controller.refresh_data(@elems_on_page,@current_page)
      pages_label.text = "#{@current_page}/#{amount_of_pages}"
    end
    buttonForward.connect(SEL_COMMAND) do
      if (@current_page) == amount_of_pages
        next
      end
      @current_page += 1
      @controller.refresh_data(@elems_on_page,@current_page)
      pages_label.text = "#{@current_page}/#{amount_of_pages}"
    end
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

  def setup_crud_frame()
    button_add = FXButton.new(@buttom_frame, "Добавить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
    button_update = FXButton.new(@buttom_frame, "Обновить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
    button_change = FXButton.new(@buttom_frame, "Изменить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
    button_delete = FXButton.new(@buttom_frame, "Удалить", opts: BUTTON_NORMAL | LAYOUT_CENTER_X)
  end

  def setup_table_frame()
    @table = FXTable.new(@frame_right, opts: LAYOUT_FILL)
  end

  def set_table_params(column_names,entities_count)
    # Устанавливаем количество строк и столбцов
    @table.setTableSize(entities_count, column_names.size) # Установить размер таблицы: 7 строк и 4 столбца

    # Установка заголовков для столбцов
    i = 0
    column_names.each do |column_name|
      @table.setColumnText(i,column_name)
      i += 1
    end
  end

  def set_table_data(data_table)
    students = data_table.data
    # Заполнение таблицы данными студентов
    students.each_with_index do |student, row|
      student.each_with_index do |value, col|
        @table.setItemText(row, col, (value || "N/A").to_s) # Если значение nil, заменяем на "N/A"
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