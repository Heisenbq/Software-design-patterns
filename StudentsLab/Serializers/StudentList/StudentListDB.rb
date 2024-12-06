require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentRepository.rb')
require 'pg'




class StudentListDB
  def initialize(db_config)
    @student_repository = StudentRepository.instance(db_config)
  end
  def get_student_by_id(id)
    @student_repository.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    @student_repository.get_student_short_list(amount_of_elems_on_page, page)
  end


  def add_student_in_list(student)
    @student_repository.add_student(student)
  end

  def change_by_id(id,student)
    @student_repository.update_student(id, student)
  end
  def delete(id)
    @student_repository.delete_student(id)
  end
end
