require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeStrategy.rb')

class StudentSerializeYamlStrategy < StudentSerializeStrategy
  def parse_to_student
    yaml_data = File.read(@path)
    students_data = YAML.load(yaml_data)
  end
  def parse_to_format
    data = YAML.dump(@students.map(&:to_hash))
  end
end