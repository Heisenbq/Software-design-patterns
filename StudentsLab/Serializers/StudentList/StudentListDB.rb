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


  def add_student_in_list(student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    @connection.exec_params('INSERT INTO student (first_name, surname, last_name, email, telegram, phone, git, dob)
        VALUES ($1,$2,$3,$4,$5,$6,$7,$8)', [student.first_name, student.surname, student.last_name, student.email, student.telegram, student.phone, student.github, student.dob])
  end

  def change_by_id(id,student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    @connection.exec_params('UPDATE student 
        SET first_name = $1, surname = $2, last_name = $3, email = $4, telegram = $5, phone = $6, git = $7, dob = $8 
        WHERE id = $9', [student.first_name, student.surname, student.last_name, student.email, student.telegram, student.phone, student.github, student.dob,id])
  end
  def delete(id)
    @connection.exec_params('DELETE FROM student WHERE id = $1', [student.id])
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
# student_data = {
#   "id" => "1",
#   "first_name" => "John",
#   "surname" => "Dosee",
#   "last_name" => "Smith",
#   "email" => "john.doe@example.com",
#   "telegram" => "john_doe_telegram",
#   "phone" => "8-800-535-30-30",
#   "git" => "https://github.com/johndoe",
#   "dob" => "1994-08-22"
# }
# student = Student.new(student_data)
# puts st.add_student_in_list(student)
puts st.get_student_short_list(6,1).get_data