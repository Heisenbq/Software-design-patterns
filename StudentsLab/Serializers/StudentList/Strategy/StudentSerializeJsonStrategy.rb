require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeStrategy.rb')

class StudentSerializeJsonStrategy < StudentSerializeStrategy
  def parse_to_student
    json_data = File.read(@path)
    students_data = JSON.parse(json_data)
  end
  def parse_to_format
    data = JSON.pretty_generate(@students.map(&:to_hash))
  end
end