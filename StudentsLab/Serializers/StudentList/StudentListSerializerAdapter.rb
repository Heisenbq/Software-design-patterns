require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
class StudentListSerializerAdapter < IStorageList
  def initialize(student_list_json)
    unless student_list_json.is_a?(StudentListSerializer)
      raise ArgumentError, "required StudentListDB"
    end
    @student_list_json = student_list_json
  end

  def get_student_by_id(id)
    @student_list_json.read_from_file()
    @student_list_json.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    @student_list_json.read_from_file()
    @student_list_json.get_student_short_list(amount_of_elems_on_page,page)
  end
  
  def add_student_in_list(student)
    @student_list_json.read_from_file()
    @student_list_json.add_student_in_list(student)
    @student_list_json.write_to_file()
  end

  def change_by_id(id,student)
    @student_list_json.read_from_file()
    @student_list_json.change_by_id(id,student)
    @student_list_json.write_to_file()
  end
  def delete(id)
    @student_list_json.read_from_file()
    @student_list_json.delete(id)
    @student_list_json.write_to_file()
  end
end