require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require 'yaml'

class StudentListYAML < StudentListSerializer
  def initialize(path)
    super(path,StudentSerializeYamlStrategy.new())
  end
end

s = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")

a = StudentListYAML.new('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.yaml')
a.read_from_file
a.add_student_in_list(s)
puts a.students
a.write_to_file