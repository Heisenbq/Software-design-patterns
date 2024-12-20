require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/PGClient.rb')
require 'pg'




class StudentListDB < IStorageList
  def initialize(db_config)
    @client = PGClient.instance(db_config)
  end
  def get_student_by_id(id)
    result = @client.exec_params('SELECT * FROM student WHERE id = $1', [id])
    st = nil
    result.each do |row|
      st = Student.new(row)
    end
    return st
  end

  def get_student_short_list(amount_of_elems_on_page,page,filter = nil)
    result = @client.exec('SELECT * FROM student')
    students = []
    result.each do |row|
      students.append(Student.new(row))
    end
    if filter != nil 
      students = filter.do_filter(students)
    end
    students_slices = students.each_slice(amount_of_elems_on_page).to_a
    student_short_array = []
    if students_slices.count > 0
      students_slices[page-1].each do |student|
        student_short_array.append(Student_short.create_by_student(student))
      end
    end
    start_index = amount_of_elems_on_page * (page - 1)
    DataListStudentShort.new(student_short_array,start_index)
  end

  def add_student_in_list(student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    begin
      @client.exec_params('INSERT INTO student (first_name, surname, last_name, email, telegram, phone, git, dob)
          VALUES ($1,$2,$3,$4,$5,$6,$7,$8)', [student.first_name, student.surname, student.last_name, student.email, student.telegram, student.phone, student.github, student.dob])
    rescue PG::UniqueViolation => e
      raise ArgumentError, "Пользователь уже имеется с такими контактами!"
    end
  end

  def change_by_id(id,student)
    raise ArgumentError, "Expect the instance of Student" if !student.is_a?(Student)
    begin
      @client.exec_params('UPDATE student 
          SET first_name = $1, surname = $2, last_name = $3, email = $4, telegram = $5, phone = $6, git = $7, dob = $8 
          WHERE id = $9', [student.first_name, student.surname, student.last_name, student.email, student.telegram, student.phone, student.github, student.dob,id])\
    rescue PG::UniqueViolation => e
      raise ArgumentError, "Пользователь уже имеется с такими контактами!"
    end
  end
  def delete(id)
    @client.exec_params('DELETE FROM student WHERE id = $1', [student.id])
  end
  def get_student_count(filter = nil)
    raise ArgumentError, "Expect the instance of Filter"  if !filter.is_a?(Filter) && filter!=nil
    # result = @connection.exec_params('SELECT COUNT(*) FROM student')
    result = @client.exec('SELECT * FROM student')
    students = []
    result.each do |row|
      students.append(Student.new(row))
    end
    if filter !=nil
      new_list = filter.do_filter(students) 
      return new_list.count
    end
    students.count
  end
end
