require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/IStorageList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeJsonStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeYamlStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializerAdapter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListDBAdapter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListDB.rb')
require 'yaml'
require 'json'
class StudentList 
  def initialize(student_list_adapter)
    unless student_list_adapter.is_a?(IStorageList)
      raise ArgumentError, "required IStorageList"
    end
    @student_list_adapter = student_list_adapter
  end

  def get_student_by_id(id)
    @student_list_adapter.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    @student_list_adapter.get_student_short_list(amount_of_elems_on_page, page)
  end

  def add_student_in_list(student)
    @student_list_adapter.add_student(student)
  end

  def change_by_id(id,student)
    @student_list_adapter.update_student(id, student)
  end
  def delete(id)
    @student_list_adapter.delete_student(id)
  end
end

# s = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")

# a = StudentListSerializer.new('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.yaml', StudentSerializeYamlStrategy.new())
# b = StudentListSerializerAdapter.new(a)
# db_config = {
#   host: 'localhost',  
#   dbname: 'student',  
#   user: 'postgres',   
#   password: '2012'  
# }
# b1 = StudentListDB.new(db_config)
# c = StudentListDBAdapter.new(b1)
# d = StudentList.new(b)
# puts d.get_student_by_id(2)