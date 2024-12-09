require 'fox16'

include Fox

class MyWindow < FXMainWindow
  def initialize(app)
    super(app, "FXRuby Layout Example", width: 800, height: 600)

    # Основной вертикальный фрейм (для размещения всех фреймов)
    main_frame = FXVerticalFrame.new(self, opts: LAYOUT_FILL)

    # Верхний фрейм (80% высоты)
    top_frame = FXHorizontalFrame.new(main_frame, opts: LAYOUT_FILL)

    # Первый фрейм слева (20% ширины)
    left_frame = FXVerticalFrame.new(top_frame, opts: LAYOUT_FILL | LAYOUT_SIDE_LEFT, width: 160)
    label_left = FXLabel.new(left_frame, "Left Frame (20%)", opts: LAYOUT_FILL)

    # Второй фрейм справа (80% ширины)
    right_frame = FXVerticalFrame.new(top_frame, opts: LAYOUT_FILL | LAYOUT_SIDE_RIGHT)
    label_right = FXLabel.new(right_frame, "Right Frame (80%)", opts: LAYOUT_FILL)

    # Нижний фрейм (10% высоты)
    bottom_frame = FXHorizontalFrame.new(main_frame, opts: LAYOUT_FILL | LAYOUT_SIDE_BOTTOM, height: 60)
    label_bottom = FXLabel.new(bottom_frame, "Bottom Frame (10%)", opts: LAYOUT_FILL)
  end
end

# Создание и запуск приложения
app = FXApp.new
window = MyWindow.new(app)
app.create
window.show
app.run