require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require 'yaml'

class StudentListYAML
  attr_accessor :students

  def initialize(path)
    @path = path
    @students
  end

  def read_from_file
    yaml_data = File.read(@path)
    students_data = YAML.load(yaml_data)
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
    yaml_data = YAML.dump(@students.map(&:to_hash))
    File.write(@path,yaml_data)
  end

  def get_student_by_id(id)
    yaml_data = File.read(@path)
    students_data = YAML.load(yaml_data)
    student = students_data.find do |student|
      student['id'] == id
    end

    Student.new(
        phone: student['phone'],
        telegram: student['telegram'],
        email: student['email'],
        surname: student['surname'],
        first_name: student['first_name'],
        last_name: student['last_name'],
        dob: student['dob'],
        id: student['id'],
        github: student['github']
      )
    nil
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    yaml_data = File.read(@path)
    students_data = YAML.load(yaml_data)
    student_slice = students_data.each_slice(amount_of_elems_on_page).to_a
    student_short_array = []
    student_slice[page-1].each do |student|
      new_student = Student.new(
        phone: student['phone'],
        telegram: student['telegram'],
        email: student['email'],
        surname: student['surname'],
        first_name: student['first_name'],
        last_name: student['last_name'],
        dob: student['dob'],
        id: student['id'],
        github: student['github']
      )
      student_short_array.append(Student_short.create_by_student(new_student))
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
    @students.append(student)
  end

  def change_by_id(id,student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    stud = @students.find {|el| el.id == id}
    if stud
      student.id=id
      stud = student
    end
    stud
  end
  def delete(id)
    @students.delete_if {|el| el.id == id}
  end
  def get_student_count
    @students.count
  end
end

s = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")

a = StudentListYAML.new('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.yaml')
a.read_from_file
a.add_student_in_list(s)
puts a.students
a.write_to_file