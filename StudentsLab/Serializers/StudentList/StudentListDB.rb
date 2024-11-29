require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require 'pg'




class StudentListDB
  attr_accessor :connection
  def get_student_by_id(id)
    result = @connection.exec_params('SELECT * FROM student WHERE id = $1', [id])
    # Student.new(result)
    # Обрабатываем результат
    result.each do |row|
      puts row
      st = Student.new(row)
      puts st
    end
    
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    result = @connection.exec('SELECT * FROM student')
    students = []
    result.each do |row|
      students.append(Student.new(row))
    end
    students_slices = students.each_slice(amount_of_elems_on_page).to_a
    student_short_array = []
    students_slices[page-1].each do |student|
      student_short_array.append(Student_short.create_by_student(student))
    end
    DataListStudentShort.new(student_short_array)
  end

end

# Параметры подключения к PostgreSQL
db_config = {
  host: 'localhost',   # Адрес хоста (можно изменить, если PostgreSQL на другом сервере)
  dbname: 'student',   # Название вашей базы данных
  user: 'postgres',   # Имя пользователя
  password: '2012'  # Пароль
}

# Создание подключения к PostgreSQL
conn = PG.connect(db_config)

st = StudentListDB.new()
st.connection = conn
puts st.get_student_short_list(5,1).get_data