require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require 'json'

class StudentListJSON
  def initialize(path)
    @path = path
    @students
  end

  def read_from_file
    json_data = File.read(@path)
    students_data = JSON.parse(json_data)
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
  
  def write_to_file(students)
    json_data = JSON.pretty_generate(students.map(&:to_hash))
    File.write(@path,json_data)
  end

  def get_student_by_id(id)
    json_data = File.read(@path)
    students_data = JSON.parse(json_data)
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
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    json_data = File.read(@path)
    students_data = JSON.parse(json_data)
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
    if !student.is_a?(Student) raise ArgumentError, "Expect the instance of Student"
    max_id = @students.max_by {|el| el.id}
    student.id = max_id + 1
    @students.append(student)
  end
end

a = StudentListJSON.new('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.json')
a.read_from_file
puts a.sort_by_surname_initials
# students = StudentListJSON.read_from_file('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.json')
# StudentListJSON.write_to_file('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList1.json',students)
# puts StudentListJSON.get_student_short_list('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList1.json',5,1).get_data