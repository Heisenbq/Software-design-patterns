require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeJsonStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeYamlStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/Filter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require 'yaml'
require 'json'
class StudentListSerializer
  attr_accessor :students

  def initialize(path,serialize_strategy)
    @path = path
    @students
    @serialize_strategy = serialize_strategy
  end

  def read_from_file
    data = File.read(@path)
    students_data = parse_to_student(data)
    students = students_data.map do |student_data|
      Student.new(
        phone: student_data['phone'],
        telegram: student_data['telegram'],
        email: student_data['email'],
        surname: student_data['surname'],
        first_name: student_data['first_name'],
        last_name: student_data['last_name'],
        dob: student_data['dob'],
        id: student_data['id'],
        github: student_data['github']
      )
    end
    @students = students
  end
  
  def write_to_file
    data = parse_to_format(@students)
    File.write(@path,data)
  end

  def get_student_by_id(id)
    @students.find {|el| el.id == id}
  end

  def get_student_short_list(amount_of_elems_on_page,page,filter = nil)
    filtered_students = @students
    if filter != nil 
      filtered_students = filter.do_filter(@students)
    end
    students_slices = filtered_students.each_slice(amount_of_elems_on_page).to_a
    student_short_array = []
    if students_slices.count > 0
      students_slices[page-1].each do |student|
        student_short_array.append(Student_short.create_by_student(student))
      end
    end
    DataListStudentShort.new(student_short_array)
  end

  def sort_by_surname_initials
    @students.sort_by {|element| element.surname_initials}
  end

  def add_student_in_list(student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    max_id = (@students.max_by {|el| el.id}).id
    student.id = max_id + 1
    @students.any? {|el| el.same_contacts?(student)}
    # check_on_unique_constraint(student)
    @students.append(student)
  end

  def change_by_id(id,student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    stud = @students.find {|el| el.id == id}
    if stud
      student.id=id
      stud = student
    end
    check_on_unique_constraint(student)
    stud
  end
  def delete(id)
    @students.delete_if {|el| el.id == id}
  end
  def get_student_count(filter=nil)
    raise ArgumentError, "Expect the instance of Filter"  if !filter.is_a?(Filter) && filter!=nil
    if filter !=nil
      new_list = filter.do_filter(@students)
      return new_list.count
    end
    @students.count
  end

  private 
  def parse_to_student(data)
    @serialize_strategy.parse_to_student(data)
  end
  def parse_to_format(students)
    @serialize_strategy.parse_to_format(students)
  end


end
