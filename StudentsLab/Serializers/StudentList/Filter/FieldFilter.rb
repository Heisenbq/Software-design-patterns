require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/Filter.rb')
class FieldFilter < Filter
  def initialize(field,value)
    @value = value
    @field = field
  end
  def do_filter(students)
    raise ArgumentError, "Expect the instance of array of Students" if !students.all? {|el| el.is_a?(Student)}
    case @field
    when "first_name"
      students.filter {|student| student.first_name == @value}
    when "surname"
      students.filter {|student| student.surname == @value}
    when "last_name"
      students.filter {|student| student.last_name == @value}
    when "id"
      students.filter {|student| student.id == @value}
    when "github"
      students.filter {|student| student.github == @value}
    when "phone"
      students.filter {|student| student.phone == @value}
    when "telegram"
      students.filter {|student| student.telegram == @value}
    when "email"
      students.filter {|student| student.email == @value}
    when "dob"
      students.filter {|student| student.dob == @value}
    else 
      raise ArgumentError, "not defined the such field in object"
    end
  end
end