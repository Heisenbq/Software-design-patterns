require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require 'json'

class StudentListJSON

  def self.read_from_file(path)
    json_data = File.read(path)
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
    students
  end
  
  def self.write_to_file(path, students)
    json_data = JSON.pretty_generate(students.map(&:to_hash))
    File.write(path,json_data)
  end
end

students = StudentListJSON.read_from_file('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.json')
StudentListJSON.write_to_file('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList1.json',students)