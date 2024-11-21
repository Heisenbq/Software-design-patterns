require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require 'json'

class StudentListJSON < StudentListSerializer
  private 
  def parse_to_student
    json_data = File.read(@path)
    students_data = JSON.parse(json_data)
  end
  def parse_to_format
    data = JSON.pretty_generate(@students.map(&:to_hash))
  end
end
