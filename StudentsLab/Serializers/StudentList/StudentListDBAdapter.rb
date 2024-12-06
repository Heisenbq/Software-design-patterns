require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListDB.rb')
class StudentListDBAdapter < IStorageList

  def initialize(student_list_db)
    unless student_list_db.is_a?(StudentListDB)
      raise ArgumentError, "required StudentListDB"
    end
    @student_list_db = student_list_db
  end

  def get_student_by_id(id)
    @student_list_db.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    @student_list_db.get_student_short_list(amount_of_elems_on_page,page)
  end
  
  def add_student_in_list(student)
    @student_list_db.add_student_in_list(student)
  end

  def change_by_id(id,student)
    @student_list_db.change_by_id(id,student)
  end
  def delete(id)
    @student_list_db.delete(id)
  end
end