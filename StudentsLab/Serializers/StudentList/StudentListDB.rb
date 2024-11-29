require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentRepository.rb')
require 'pg'




class StudentListDB
  def initialize(db_config)
    @student_repository = StudentRepository.new(db_config)
  end
  def get_student_by_id(id)
    @student_repository.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    @student_repository.get_student_short_list(amount_of_elems_on_page, page)
  end


  def add_student_in_list(student)
    @student_repository.add_student(student)
  end

  def change_by_id(id,student)
    @student_repository.update_student(id, student)
  end
  def delete(id)
    @student_repository.delete_student(id)
  end
end

# Параметры подключения к PostgreSQL
db_config = {
  host: 'localhost',   # Адрес хоста (можно изменить, если PostgreSQL на другом сервере)
  dbname: 'student',   # Название вашей базы данных
  user: 'postgres',   # Имя пользователя
  password: '2012'  # Пароль
}

st = StudentListDB.new(db_config)
# puts st.get_student_by_id(7)
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
puts st.get_student_short_list(5,2).get_data