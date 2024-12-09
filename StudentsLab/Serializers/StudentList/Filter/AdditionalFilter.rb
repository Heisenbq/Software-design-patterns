require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/Filter.rb')
class AdditionalFilter < FilterDecorator
  def initialize(filter,field, value)
    super(filter)
    @field = field
    @value = value
  end
  def do_filter(students)
    super(students).filter {|student| }
    raise ArgumentError, "Expect the instance of array of Students" if !students.all? {|el| el.is_a?(Student)}
    case @field
    when "first_name"
      super(students).filter {|student| student.first_name == @value}
    when "surname"
      super(students).filter {|student| student.surname == @value}
    when "last_name"
      super(students).filter {|student| student.last_name == @value}
    when "id"
      super(students).filter {|student| student.id == @value}
    when "github"
      super(students).filter {|student| student.github == @value}
    when "phone"
      super(students).filter {|student| student.phone == @value}
    when "telegram"
      super(students).filter {|student| student.telegram == @value}
    when "email"
      super(students).filter {|student| student.email == @value}
    when "dob"
      super(students).filter {|student| student.dob == @value}
    else 
      raise ArgumentError, "not defined the such field in object"
    end
  end
end